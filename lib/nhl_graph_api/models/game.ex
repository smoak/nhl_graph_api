defmodule NhlGraphApi.Models.Game do
  @moduledoc """
  Represents a single Game
  """

  defstruct [:id, :start_time_utc, :away_team, :home_team]

  @type t :: %__MODULE__{
          id: integer,
          start_time_utc: integer,
          away_team: NhlGraphApi.Models.Team.t(),
          home_team: NhlGraphApi.Models.Team.t()
        }

  @spec new(%{
          id: integer,
          start_time_utc: integer,
          away_team: NhlGraphApi.Models.Team.t(),
          home_team: NhlGraphApi.Models.Team.t()
        }) :: t
  def new(%{id: id, start_time_utc: start_time_utc, away_team: away_team, home_team: home_team}) do
    %__MODULE__{
      id: id,
      start_time_utc: start_time_utc,
      away_team: away_team,
      home_team: home_team
    }
  end
end
