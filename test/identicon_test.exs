defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon
  setup_all do
    {:ok,
    hex: [31, 56, 112, 190, 39, 79, 108, 73, 179, 227, 26, 12, 103, 40, 149, 127],
    color: {31, 56, 112}
    }
  end

  test "struct is created from list", state do
    %Identicon.Image{hex: hex} = Identicon.to_image_struct(state[:hex])
    assert hex == state[:hex]
  end

  test "create colour rgb from image struct", state do
    %Identicon.Image{color: color} = Identicon.pick_color(%Identicon.Image{hex: state[:hex]})
    assert state[:color]  == color
  end

end
