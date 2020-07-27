defmodule NhlGraphApi.GraphQL.Resolvers.Conference do
  @moduledoc """
  The resolvers for the Conference type
  """
  alias NhlGraphApi.Repos.Conference

  def list(_, _, _) do
    {:ok, Conference.find_all()}
  end

  def by_id(_parent, %{id: id}, _resolution) do
    {:ok, Conference.find_by_id(id)}
  end

  def from_division(%{conference: %{id: conference_id}}, _args, _resolution) do
    {:ok, Conference.find_by_id(conference_id)}
  end
end
