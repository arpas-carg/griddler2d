defmodule Griddler2D.Topology do
  @moduledoc """
  Funzioni di supporto: adiacenze, pairwise, ecc.
  """

  def pairwise(list) do
    Enum.chunk_every(list, 2, 1, :discard)
  end
end
