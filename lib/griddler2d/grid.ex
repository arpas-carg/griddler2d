defmodule Griddler2D.Grid do
  alias Griddler2D.GridRowCol

  def make(row_y, col_x, step \\ 1) do
    for y <- 0..row_y do
      for x <- 0..col_x do
        GridRowCol.make(x * step, y * step)
      end
    end
  end
end
