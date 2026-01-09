defmodule Griddler2D.Adapters.SVG do
  @moduledoc "Conversione celle e linee in path SVG"

  alias Griddler2D.Cell
  alias Griddler2D.Line

  require XmlBuilder

  @doc """
  Converte una cella in un elemento <polygon> SVG
  """
  def cell_to_element(%Cell{corners: corners}) do
    points =
      corners
      |> Enum.map(fn {x, y} -> "#{x},#{y}" end)
      |> Enum.join(" ")

    XmlBuilder.element(:polygon, %{points: points})
  end

  @doc """
  Converte una linea in un elemento <line> SVG
  """
  def line_to_element(%Line{start: {x1, y1}, end: {x2, y2}}) do
    XmlBuilder.element(:line, %{x1: x1, y1: y1, x2: x2, y2: y2})
  end

  @doc """
  Genera l'intero SVG come stringa
  """
  def to_svg(elements, width \\ 500, height \\ 500) do
    svg =
      XmlBuilder.document(
        :svg,
        %{xmlns: "http://www.w3.org/2000/svg", width: width, height: height},
        elements
      )

    XmlBuilder.generate(svg)
  end
end
