defmodule Identicon.Binary do

  def to_list(hex) do
    :binary.bin_to_list(hex)
  end

end
