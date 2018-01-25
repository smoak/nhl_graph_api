defmodule NhlGraphApi.Schema do
  use Absinthe.Schema
  import_types(NhlGraphApi.Schema.ContentTypes)

  alias NhlGraphApi.Resolvers

  query do
    field :teams, list_of(:team) do
      resolve(&Resolvers.Content.list_teams/3)
    end
  end
end
