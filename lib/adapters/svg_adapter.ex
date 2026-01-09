defmodule Griddler2D.Adapters.SVG do
  @moduledoc "Conversione celle e linee in path SVG"

  alias Griddler2D.Cell
  alias Griddler2D.Line

  def cell_to_path(%Cell{corners: corners}) do
    corners
    |> Enum.map(fn {x,y} -> "#{x},#{y}" end)
    |> Enum.join(" ")
    |> (&"<polygon points=\"#{&1}\" />").()
  end

  def line_to_path(%Line{start: {x1,y1}, end: {x2,y2}}) do
    "<line x1=\"#{x1}\" y1=\"#{y1}\" x2=\"#{x2}\" y2=\"#{y2}\" />"
  end
end
