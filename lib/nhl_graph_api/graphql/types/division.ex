defmodule NhlGraphApi.GraphQL.Types.Division do
  use Absinthe.Schema.Notation

  @desc "The groupings of members of a given conference"
  object :division do
    field(:id, non_null(:id))
    
    @desc "The name of the division"
    field(:name, non_null(:string))

    
    field(:abbreviation, non_null(:string))

    @desc "The conference this division belongs to"
    field(:conference, non_null(:conference)) do
    end

    @desc "Indicates whether the division is active or not"
    field(:active, non_null(:boolean))
  end
end