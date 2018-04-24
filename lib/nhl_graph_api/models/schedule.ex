defmodule NhlGraphApi.Models.Schedule do
  @moduledoc """
  Represents a schedule
  """

  defstruct [:games]

  @type t :: %__MODULE__{
          games: list(NhlGraphApi.Models.Game.t())
        }

  @spec new(%{games: NhlGraphApi.Models.Game.t()}) :: t
  def new(%{games: games}) do
    %__MODULE__{
      games: games
    }
  end
end
