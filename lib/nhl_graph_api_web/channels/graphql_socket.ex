defmodule NhlGraphApiWeb.GraphQLSocket do
  use Phoenix.Socket
  use Absinthe.Phoenix.Socket, schema: NhlGraphApi.GraphQL.Schema

  ## Channels
  # channel "room:*", NhlGraphApiWeb.RoomChannel

  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end
