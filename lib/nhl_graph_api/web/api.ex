defmodule NhlGraphApi.Web.Api do
  use Plug.Router

  plug(
    Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
    pass: ["*/*"],
    json_decoder: Poison
  )

  plug(:match)
  plug(:dispatch)

  forward(
    "/graphiql",
    to: Absinthe.Plug.GraphiQL,
    init_opts: [schema: NhlGraphApi.GraphQL.Schema, interface: :simple]
  )

  forward("/", to: Absinthe.Plug, init_opts: [schema: NhlGraphApi.GraphQL.Schema])
end
