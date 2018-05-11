defmodule NhlGraphApi.GraphQL.Types.Game do
  use Absinthe.Schema.Notation

  @desc "An NHL game"
  object :game do
    field(:id, non_null(:id))
    field(:start_time_utc, non_null(:string))
    field(:away_team, non_null(:team))
    field(:home_team, non_null(:team))
  end
end