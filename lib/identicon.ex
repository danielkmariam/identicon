defmodule Identicon do

  import Identicon.Binary
  import Identicon.Crypto
  alias Identicon.Image

  def to_image_struct(hex_list) do
    %Image{hex: hex_list}
  end

  def pick_color(%Image{hex: [r, g , b | _tail]} = image) do
    %Image{image | color: {r, g, b}}
  end

end
