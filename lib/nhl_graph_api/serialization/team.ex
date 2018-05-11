defmodule NhlGraphApi.Serialization.Team do
  alias NhlGraphApi.Models.Team

  @spec from_json(map()) :: Team.t()
  def from_json(json) do
    Team.new(%{
      id: json["id"],
      city: json["locationName"],
      name: json["name"],
      abbreviation: json["abbreviation"]
    })
  end
end
