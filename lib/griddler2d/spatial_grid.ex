defmodule Griddler2D.SpatialGrid do
  def make(vertex_list) do
    lista = Map.to_list(vertex_list)

    spatial_grid =
      Enum.reduce(lista, %{}, fn {k, v}, acc ->
        Map.put(acc, k, v)
      end)

    if length(lista) == length(Map.keys(spatial_grid)) do
      spatial_grid
    else
      raise("Chiavi doppia.")
    end
  end

  def make_lines(lines, spatial_grid) do
    Enum.map(
      lines,
      fn %Griddler2D.GridLine{start: inizio, end: fine} ->
        p1 = Map.get(spatial_grid, inizio)
        p2 = Map.get(spatial_grid, fine)
        %{start: p1, end: p2}
      end
    )
  end

  def make_cells(cells, spatial_grid) do
    Enum.map(cells, fn %Griddler2D.GridCell{id: nome, corners: [lb, rb, rt, lt]} ->
      p1 = Map.get(spatial_grid, lb)
      p2 = Map.get(spatial_grid, rb)
      p3 = Map.get(spatial_grid, rt)
      p4 = Map.get(spatial_grid, lt)
      {nome, [p1, p2, p3, p4, p1]}
    end)
  end
end
