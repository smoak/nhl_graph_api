defmodule NhlGraphApi.GraphQL.Resolvers.Schedule do
  alias NhlGraphApi.Repos.Schedule

  @spec list(any(), map(), Absinthe.Blueprint.t()) :: {:ok, NhlGraphApi.Models.Schedule.t()}
  def list(_, _, _) do
    {:ok, Schedule.find_all()}
  end
end
