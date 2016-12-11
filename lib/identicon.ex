defmodule Identicon do

  import Identicon.Binary
  import Identicon.Crypto
  alias Identicon.Image

  def generate(data) do
    data
      |> to_hash
      |> to_list
      |> to_image_struct
      |> pick_color
      |> build_grid
      |> remove_odd_cells
      |> build_pixel_coordinates
  end

  def to_image_struct(hex) do
    %Image{hex: hex}
  end

  def pick_color(%Image{hex: [r, g , b | _tail]} = image) do
    %Image{image | color: {r, g, b}}
  end

  def build_grid(%Image{hex: hex} = image) do
    grid = hex
      |> Enum.chunk(3)
      |> Enum.map(&mirror_row/1)
      |> List.flatten
      |> Enum.with_index

    %Image{image | grid: grid}
  end

  def remove_odd_cells(%Image{grid: grid} = image) do
      grid = Enum.filter grid, fn({code, _index}) ->
        rem(code, 2) == 0
      end

      %Image{image | grid: grid}
  end

  def build_pixel_coordinates(%Image{grid: grid} = image) do
    coordinates = Enum.map grid, fn({_code, index}) ->
      x = rem(index, 50) * 50
      y = div(index, 50) * 50

      {{x, y}, {x + 50, y + 50}}
    end

    %Image{image | coordinates: coordinates}
  end

  defp mirror_row([first, second | _tail] = row) do
    row ++ [second, first]
  end

end
