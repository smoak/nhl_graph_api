defmodule NhlGraphApi.Api do
  use Plug.Router

  plug(
    Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
    pass: ["*/*"],
    json_decoder: Poison
  )

  plug(:match)
  plug(:dispatch)

  plug(Absinthe.Plug, schema: NhlGraphApi.Schema)

  forward(
    "/graphiql",
    to: Absinthe.Plug.GraphiQL,
    init_opts: [schema: NhlGraphApi.Schema, interface: :simple]
  )

  match _ do
    conn |> not_found
  end

  defp not_found(conn) do
    conn |> send_resp(404, "not found")
  end
end
