defmodule NhlGraphApi.GraphQL.Resolvers.Team do
  alias NhlGraphApi.Repos.Team

  @spec list(any(), map(), Absinthe.Blueprint.t()) :: {:ok, list(Team.t())}
  def list(_, _, _) do
    {:ok, Team.find_all()}
  end

  def by_id(_parent, %{id: id}, _resolution) do
    {:ok, Team.find_by_id(id)}
  end
end
