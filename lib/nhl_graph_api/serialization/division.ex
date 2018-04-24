defmodule NhlGraphApi.Serialization.Division do
  alias NhlGraphApi.Models.Division

  def from_json(json) do
    Division.new(%{
      id: json["id"],
      name: json["name"],
      abbreviation: json["abbreviation"],
      active: json["active"],
      conference_id: json["conference"]["id"]
    })
  end
end
