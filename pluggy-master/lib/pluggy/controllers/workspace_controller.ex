defmodule Pluggy.WorkspaceController do 
    import Plug.Conn, only: [send_resp: 3]
    
    def create(conn, params) do
		name = params["name"]
        company = params["email"]
        pwd = params["code"]
        
        code = Bcrypt.hash_pwd_salt(pwd)

		Postgrex.query!(DB, "INSERT INTO workspaces (name, company, hash) VALUES ($1, $2, $3)", [name, company, code,],
		    pool: DBConnection.Poolboy
			)
			
        redirect(conn, "/")
        
    
    end


    defp redirect(conn, url), do: Plug.Conn.put_resp_header(conn, "location", url) |> send_resp(303, "")

end