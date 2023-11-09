defmodule TestoTest do
  use ExUnit.Case
  doctest Testo

  test "greets the world" do
    assert Testo.hello() == :world
  end
end
