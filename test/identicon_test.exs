defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon

  test "struct is created from list" do
    list = [31, 56, 112, 190, 39, 79, 108, 73, 179, 227, 26, 12, 103, 40, 149, 127]

    %Identicon.Image{hex: hex} = Identicon.to_image_struct(list)

    assert hex == list
  end

end
