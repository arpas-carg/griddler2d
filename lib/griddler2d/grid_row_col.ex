defmodule Griddler2D.GridRowCol do
  defstruct row_y: 0, col_x: 0

  def make(row, col) do
    %__MODULE__{row_y: row, col_x: col}
  end
end
