defmodule NhlGraphApi.Models.Division do
  @moduledoc """
  Represents a single division
  """

  defstruct [:id, :name, :abbreviation, :active, :conference_id]

  def new(%{
        id: id,
        name: name,
        abbreviation: abbreviation,
        active: active,
        conference_id: conference_id
      }) do
    %__MODULE__{
      id: id,
      name: name,
      abbreviation: abbreviation,
      active: active,
      conference_id: conference_id
    }
  end
end
