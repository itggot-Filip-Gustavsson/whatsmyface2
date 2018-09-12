defmodule Pluggy.WtfController do
  
  require IEx

  alias Pluggy.Wtf
  alias Pluggy.User
  import Pluggy.Template, only: [render: 2]
  import Plug.Conn, only: [send_resp: 3]


  def index(conn) do

    #get user if logged in
    session_user = conn.private.plug_session["user_id"]
    current_user = case session_user do
      nil -> nil
      _   -> User.get(session_user)
    end

    if current_user == nil do
      send_resp(conn, 200, render("wtf/login", wtf: Wtf.all(), user: current_user))
    else
      Postgrex.query!(DB, "SELECT * FROM workspaces", [], [pool: DBConnection.Poolboy])

      send_resp(conn, 200, render("wtf/index", wtf: Wtf.all(), user: current_user))
    end
  end

  def login(conn) do
    #get user if logged in
    session_user = conn.private.plug_session["user_id"]
    current_user = case session_user do
      nil -> nil
      _   -> User.get(session_user)
    end

    send_resp(conn, 200, render("wtf/login", wtf: Wtf.all(), user: current_user))
  end

  def register(conn),     do: send_resp(conn, 200, render("wtf/register", wtf: Wtf.all()))
  def new(conn),          do: send_resp(conn, 200, render("wtf/new", []))
  def show(conn, id),     do: send_resp(conn, 200, render("wtf/show", Wtf: Wtf.get(id)))
  def edit(conn, id),     do: send_resp(conn, 200, render("wtf/edit", Wtf: Wtf.get(id)))
  
  def create(conn, params) do
    Wtf.create(params)
    #move uploaded file from tmp-folder (might want to first check that a file was uploaded)
    File.rename(params["file"].path, "priv/static/uploads/#{params["file"].filename}")
    redirect(conn, "/wtf")
  end

  def update(conn, id, params) do
    Wtf.update(id, params)
    redirect(conn, "/wtf")
  end

  def destroy(conn, id) do
    Wtf.delete(id)
    redirect(conn, "/wtf")
  end

  defp redirect(conn, url) do
    Plug.Conn.put_resp_header(conn, "location", url) |> send_resp(303, "")
  end

end
