defmodule NhlGraphApi.GraphQL.Resolvers.Team do
  @moduledoc """
  Functions for resolving a list of teams
  """

  alias NhlGraphApi.Models.Team

  @spec list(any(), map(), Absinthe.Blueprint.t()) :: {:ok, list(Team.t())}
  def list(_, _, _) do
    {:ok, NhlGraphApi.Connectors.Nhl.get_all_teams()}
  end
end