defmodule NhlGraphApi.GraphQL.Resolvers.Division do
  @moduledoc """
  The resolvers for the Division type
  """
  alias NhlGraphApi.Repos.Division

  def list(_, _, _) do
    {:ok, Division.find_all()}
  end

  def by_id(_parent, %{id: id}, _resolution) do
    {:ok, Division.find_by_id(id)}
  end
end
