defmodule Identicon.Egd do
  
  def create_image(width \\ 250, height \\ 250) do
    :egd.create(width, height)
  end
  
  def fill_color(color) do
    :egd.color(color)
  end
  
  def filled_rectangle(image, start, stop, color) do
    :egd.filledRectangle(image, start, stop, color)
  end

  def render_image(image) do
    :egd.render(image)
  end
end
