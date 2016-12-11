defmodule Identicon.CryptoTest do
  use ExUnit.Case

  test "text is changed to a hash" do
    assert Identicon.Crypto.to_hash("apple") == <<31, 56, 112, 190, 39, 79, 108, 73, 179, 227, 26, 12, 103, 40, 149, 127>>
  end

end
