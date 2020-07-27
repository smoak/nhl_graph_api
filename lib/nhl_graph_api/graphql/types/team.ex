defmodule NhlGraphApi.GraphQL.Types.Team do
  @moduledoc """
  The Team GraphQL type
  """
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  @desc "An NHL team"
  node(object(:team)) do
    @desc "The name of the team"
    field(:name, non_null(:string))

    @desc "The city of the team"
    field(:city, non_null(:string))

    @desc "The team's abbreviation"
    field(:abbreviation, non_null(:string))
  end
end
