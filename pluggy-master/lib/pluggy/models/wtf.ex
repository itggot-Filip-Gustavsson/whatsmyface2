defmodule Pluggy.Wtf do
	
	defstruct(id: nil, name: "", tastiness: "")

	alias Pluggy.Wtf

	def all do
		Postgrex.query!(DB, "SELECT * FROM users", [], [pool: DBConnection.Poolboy]).rows
		|> to_struct_list
	end

	def get(id) do
		Postgrex.query!(DB, "SELECT * FROM wtf WHERE id = $1 LIMIT 1", [String.to_integer(id)], [pool: DBConnection.Poolboy]).rows
		|> to_struct
	end

	def update(id, params) do
		name = params["name"]
		tastiness = String.to_integer(params["tastiness"])
		id = String.to_integer(id)
		Postgrex.query!(DB, "UPDATE wtf SET name = $1, tastiness = $2 WHERE id = $3", [name, tastiness, id], [pool: DBConnection.Poolboy])
	end

	def create(params) do
		name = params["name"]
		tastiness = String.to_integer(params["tastiness"])
		Postgrex.query!(DB, "INSERT INTO wtf (name, tastiness) VALUES ($1, $2)", [name, tastiness], [pool: DBConnection.Poolboy])	
	end

	def delete(id) do
		Postgrex.query!(DB, "DELETE FROM wtf WHERE id = $1", [String.to_integer(id)], [pool: DBConnection.Poolboy])	
	end

	def to_struct([[id, name, tastiness]]) do
		%Wtf{id: id, name: name, tastiness: tastiness}
	end

	def to_struct_list(rows) do
		for [id, name, tastiness] <- rows, do: %Wtf{id: id, name: name, tastiness: tastiness}
	end



end