defmodule Identicon.BinaryTest do
  use ExUnit.Case

  test "hash is changed to a list" do
    hex = <<31, 56, 112, 190, 39, 79, 108, 73, 179, 227, 26, 12, 103, 40, 149, 127>>

    assert Identicon.Binary.to_list(hex) == [31, 56, 112, 190, 39, 79, 108, 73, 179, 227, 26, 12, 103, 40, 149, 127]
  end

end
