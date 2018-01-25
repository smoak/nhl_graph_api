defmodule NhlGraphApiTest do
  use ExUnit.Case
  doctest NhlGraphApi

  test "greets the world" do
    assert NhlGraphApi.hello() == :world
  end
end
