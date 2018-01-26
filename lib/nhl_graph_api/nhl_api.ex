defmodule NhlGraphApi.NhlApi do
  def data() do
    Dataloader.KV.new(&fetch/2)
  end

  def fetch(_batch_key, arg_maps) do
    IO.inspect(arg_maps: arg_maps)
    %{%{id: "1"} => %{id: 1, name: "foo", city: "bar", abbreviation: "OMG"}}
  end
end
