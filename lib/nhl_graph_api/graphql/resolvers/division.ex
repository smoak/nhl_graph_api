defmodule NhlGraphApi.GraphQL.Resolvers.Division do
  def list(_, _, _) do
    {:ok, NhlGraphApi.Connectors.Nhl.get_all_divisions()}
  end
end
