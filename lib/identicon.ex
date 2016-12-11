defmodule Identicon do

  import Identicon.Binary
  import Identicon.Crypto
  import Identicon.Egd
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
      |> draw_image
      |> save_image(data)
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
      x = rem(index, 5) * 50
      y = div(index, 5) * 50

      {{x, y}, {x + 50, y + 50}}
    end

    %Image{image | coordinates: coordinates}
  end

  def draw_image(%Image{color: color, coordinates: coordinates}) do
    image = create_image
    fill = fill_color(color)

    Enum.each coordinates, fn({start, stop}) ->
      filled_rectangle(image, start, stop, fill)
    end

    render_image(image)
  end

  def save_image(image, filename) do
    File.write("#{filename}.png", image)
  end

  defp mirror_row([first, second | _tail] = row) do
    row ++ [second, first]
  end

end
