defmodule NhlGraphApi.GraphQL.Types.Conference do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  @desc "Used to divide teams"
  node object(:conference) do
    @desc "The name of the conference"
    field(:name, non_null(:string))

    @desc "The abbreviation of the conference"
    field(:abbreviation, non_null(:string))

    field(:short_name, non_null(:string))

    @desc "Indicates whether the conference is active or not"
    field(:active, non_null(:boolean))
  end
end
