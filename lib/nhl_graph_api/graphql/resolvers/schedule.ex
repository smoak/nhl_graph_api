defmodule NhlGraphApi.GraphQL.Resolvers.Schedule do
  @spec list(any(), map(), Absinthe.Blueprint.t()) :: {:ok, NhlGraphApi.Models.Schedule.t()}
  def list(_, _, _) do
    {:ok, NhlGraphApi.Connectors.Nhl.get_schedule()}
  end
end