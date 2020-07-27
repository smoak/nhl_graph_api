defmodule NhlGraphApi.GraphQL.Types.Schedule do
  @moduledoc """
  The Schedule GraphQL type
  """
  use Absinthe.Schema.Notation

  object :schedule do
    field(:games, non_null(list_of(:game)))
  end
end
