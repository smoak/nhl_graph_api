defmodule NhlGraphApi.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :team do
    field(:id, non_null(:id))
    field(:name, non_null(:string))
    field(:city, non_null(:string))
    field(:abbreviation, non_null(:string))
  end

  object :game do
    field(:id, non_null(:id))
    field(:start_time_utc, non_null(:string))
    field(:away_team, non_null(:team))
    field(:home_team, non_null(:team))
  end

  object :schedule do
    field(:games, non_null(list_of(:game)))
  end
end
