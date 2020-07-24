defmodule NhlGraphApi.GraphQL.Types.GameEvent do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  @desc "An event that occurs during a game"
  node(object(:game_event)) do
    @desc "The description of the event"
    field(:description, non_null(:string))
  end
end
