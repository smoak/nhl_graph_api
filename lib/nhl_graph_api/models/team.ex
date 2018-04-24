defmodule NhlGraphApi.Models.Team do
  @moduledoc """
  Represents a single Team
  """

  defstruct [:id, :city, :name, :abbreviation]

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          city: String.t(),
          abbreviation: String.t()
        }

  @spec new(%{id: integer, name: String.t(), city: String.t(), abbreviation: String.t()}) :: t
  def new(%{id: id, name: name, city: city, abbreviation: abbreviation}) do
    %__MODULE__{
      id: id,
      name: name,
      city: city,
      abbreviation: abbreviation
    }
  end
end
