defmodule TownjudgeTest do
  use ExUnit.Case
  doctest Townjudge

  test "greets the world" do
    assert Townjudge.hello() == :world
  end
end
