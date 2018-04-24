defmodule NhlGraphApi.Serialization.Team do
  alias NhlGraphApi.Models.Team

  def from_json(json) do
    Team.new(%{
      id: json["id"],
      city: json["locationName"],
      name: json["name"],
      abbreviation: json["abbreviation"]
    })
  end
end
