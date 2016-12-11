defmodule Identicon.Crypto do

  def to_hash(data) do
    :crypto.hash(:md5, data)
  end

end
