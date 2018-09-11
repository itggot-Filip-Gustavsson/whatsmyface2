defmodule Pluggy.Router do
  use Plug.Router

  alias Pluggy.WtfController
  alias Pluggy.UserController

  plug Plug.Static, at: "/", from: :pluggy
  plug(:put_secret_key_base)

  plug(Plug.Session,
    store: :cookie,
    key: "_pluggy_session",
    encryption_salt: "cookie store encryption salt",
    signing_salt: "cookie store signing salt",
    key_length: 64,
    log: :debug,
    secret_key_base: "-- LONG STRING WITH AT LEAST 64 BYTES --"
  )

  plug(:fetch_session)
  plug(Plug.Parsers, parsers: [:urlencoded, :multipart])
  plug(:match)
  plug(:dispatch)

  get "/",                 do: WtfController.index(conn)
  get "/wtf/new",       do: WtfController.new(conn)
  get "/w/:id",            do: WtfController.show(conn, id)
  get "/wtf/:id/edit",  do: WtfController.edit(conn, id)
  
  post "/wtf",          do: WtfController.create(conn, conn.body_params)
 
  # should be put /wtf/:id, but put/patch/delete are not supported without hidden inputs
  post "/wtf/:id/edit", do: WtfController.update(conn, id, conn.body_params)

  # should be delete /wtf/:id, but put/patch/delete are not supported without hidden inputs
  post "/wtf/:id/destroy", do: WtfController.destroy(conn, id)


  post "/users/login",     do: UserController.login(conn, conn.body_params)
  post "/users/logout",    do: UserController.logout(conn)

  match _ do
    send_resp(conn, 404, "oops")
  end

  defp put_secret_key_base(conn, _) do
    put_in(
      conn.secret_key_base,
      "-- LONG STRING WITH AT LEAST 64 BYTES LONG STRING WITH AT LEAST 64 BYTES --"
    )
  end
end
