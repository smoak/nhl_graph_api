defmodule NhlGraphApi.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :team do
    field(:id, non_null(:id))
    field(:name, non_null(:string))
    field(:city, non_null(:string))
    field(:abbreviation, non_null(:string))
  end
end
