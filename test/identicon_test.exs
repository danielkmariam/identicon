defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon
  setup_all do
    {:ok,
      hex: [31, 56, 112, 190, 39, 79, 108, 73, 179, 227, 26, 12, 103, 40, 149, 127],
      color: {31, 56, 112},
      grid: [
        {31, 0}, {56, 1}, {112, 2}, {56, 3}, {31, 4}, {190, 5}, {39, 6}, {79, 7}, {39, 8},
        {190, 9}, {108, 10}, {73, 11}, {179, 12}, {73, 13}, {108, 14}, {227, 15}, {26, 16},
        {12, 17}, {26, 18}, {227, 19}, {103, 20}, {40, 21}, {149, 22}, {40, 23}, {103, 24}
      ]
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

  test "grid is created with correct format from struct", state  do
    %Identicon.Image{grid: grid} = Identicon.build_grid(%Identicon.Image{hex: state[:hex], color: state[:color]})

    assert state[:grid] == grid
  end

  test "take only grid cells with even values", state  do
    expected_even_grid_cells = [{56, 1}, {112, 2}, {56, 3}, {190, 5}, {190, 9}, {108, 10}, {108, 14},
  {26, 16}, {12, 17}, {26, 18}, {40, 21}, {40, 23}]

    %Identicon.Image{grid: grid} = Identicon.remove_odd_squares(%Identicon.Image{hex: state[:hex], color: state[:color], grid: state[:grid]})

    assert expected_even_grid_cells == grid
  end

end
