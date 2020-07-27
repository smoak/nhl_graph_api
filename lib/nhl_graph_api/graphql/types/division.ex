defmodule NhlGraphApi.GraphQL.Types.Division do
  @moduledoc """
  The Division GraphQL type
  """
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  alias NhlGraphApi.GraphQL.Resolvers.Conference

  @desc "The groupings of members of a given conference"
  node(object(:division)) do
    @desc "The name of the division"
    field(:name, non_null(:string))

    field(:abbreviation, non_null(:string))

    @desc "The conference this division belongs to"
    field(:conference, non_null(:conference)) do
      resolve(&Conference.from_division/3)
    end

    @desc "Indicates whether the division is active or not"
    field(:active, non_null(:boolean))
  end
end
