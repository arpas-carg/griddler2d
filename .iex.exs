IO.puts("from 'iex.exs'")
spatial_grid = Griddler2D.SpatialGrid.make(Griddler2D.ExampleVertex.igm25_564())

griglia = Griddler2D.Grid.make(2,2)
cells = Griddler2D.Core.cells(griglia)
lines = Griddler2D.Core.lines(griglia)


spatial_lines = Griddler2D.SpatialGrid.make_lines(lines,spatial_grid)

spatial_cells = Griddler2D.SpatialGrid.make_cells(cells,spatial_grid)
