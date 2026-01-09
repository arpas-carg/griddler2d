defmodule Griddler2D.Core do
  alias Griddler2D.Cell
  alias Griddler2D.Line

  def build_grid(nx, ny, step \\ 1) do
    for y <- 0..ny do
      for x <- 0..nx do
        {x * step, y * step}
      end
    end
  end

  def cells(grid) do
    grid
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.flat_map(fn [row1, row2] ->
      Enum.zip(row1, row2)
      |> pairwise()
      |> Enum.map(fn [{{x1, y1}, {x2, y2}}, {{x3, y3}, {x4, y4}}] ->
        %Cell{corners: [{x1, y1}, {x3, y3}, {x4, y4}, {x2, y2}]}
      end)
    end)
  end

  def lines(grid) do
    horizontal =
      grid
      |> Enum.flat_map(fn row ->
        pairwise(row)
        |> Enum.map(fn [a, b] -> %Line{start: a, end: b} end)
      end)

    vertical =
      grid
      |> Enum.zip()
      |> Enum.flat_map(fn col ->
        col
        |> Tuple.to_list()
        |> pairwise()
        |> Enum.map(fn [a, b] -> %Line{start: a, end: b} end)
      end)

    horizontal ++ vertical
  end

  defp pairwise(list) do
    Enum.chunk_every(list, 2, 1, :discard)
  end
end
