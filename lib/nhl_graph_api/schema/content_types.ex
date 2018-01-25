defmodule NhlGraphApi.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :team do
    field(:id, :id)
    field(:name, :string)
    field(:city, :string)
    field(:abbreviation, :string)
  end
end
