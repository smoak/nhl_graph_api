defmodule NhlGraphApiWeb.Router do
  use NhlGraphApiWeb, :router

  pipeline :graphql do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :graphql

    forward "/graphiql",
            Absinthe.Plug.GraphiQL,
            schema: NhlGraphApi.GraphQL.Schema,
            default_url: "/graphql",
            json_codec: Phoenix.json_library()

    forward "/graphql",
            Absinthe.Plug,
            schema: NhlGraphApi.GraphQL.Schema,
            json_codec: Phoenix.json_library()
  end
end
