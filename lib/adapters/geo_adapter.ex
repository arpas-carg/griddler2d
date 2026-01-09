defmodule Griddler2D.Adapters.Geo do
  @moduledoc "Conversione celle e linee in Geo.Polygon / Geo.LineString"

  alias Griddler2D.Cell
  alias Griddler2D.Line
  alias Geo.{Polygon, LineString}

  @epsg_italia 6707

  def cell_to_polygon(%Cell{corners: corners}) when is_list(corners) do
    %Polygon{
      # chiude il poligono
      coordinates: [corners ++ [hd(corners)]],
      srid: @epsg_italia
    }
  end

  def line_to_linestring(%Line{start: s, end: e}) do
    %LineString{coordinates: [s, e], srid: @epsg_italia}
  end
end
