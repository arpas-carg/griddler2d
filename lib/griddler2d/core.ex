defmodule Griddler2D.Core do
  alias Griddler2D.GridCell
  alias Griddler2D.GridLine

  def cells(grid) do
    grid
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.flat_map(fn [row1, row2] ->
      Enum.zip(row1, row2)
      |> pairwise()
      |> Enum.map(fn [
                       {
                         %{col_x: x1, row_y: y1},
                         %{col_x: x2, row_y: y2}
                       },
                       {
                         %{col_x: x3, row_y: y3},
                         %{col_x: x4, row_y: y4}
                       }
                     ] ->
        %GridCell{
          id: {x1, y1},
          corners: [
            # top-left
            {x1, y1},
            # bottom-left
            {x3, y3},
            # bottom-right
            {x4, y4},
            # top-right
            {x2, y2}
          ]
        }
      end)
    end)
  end

  def lines(grid) do
    horizontal =
      grid
      |> Enum.flat_map(fn row ->
        pairwise(row)
        |> Enum.map(fn [
                         %{col_x: x1, row_y: y1},
                         %{col_x: x2, row_y: y2}
                       ] ->
          %GridLine{
            start: {x1, y1},
            end: {x2, y2}
          }
        end)
      end)

    vertical =
      grid
      |> Enum.zip()
      |> Enum.flat_map(fn col ->
        col
        |> Tuple.to_list()
        |> pairwise()
        |> Enum.map(fn [
                         %{col_x: x1, row_y: y1},
                         %{col_x: x2, row_y: y2}
                       ] ->
          %GridLine{
            start: {x1, y1},
            end: {x2, y2}
          }
        end)
      end)

    horizontal ++ vertical
  end

  defp pairwise(list) do
    Enum.chunk_every(list, 2, 1, :discard)
  end
end
