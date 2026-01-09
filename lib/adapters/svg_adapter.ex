defmodule Griddler2D.Adapters.SVG do
  alias Griddler2D.Cell
  alias Griddler2D.Line
  alias XmlBuilder

  def cell_to_element(%Cell{corners: corners}) do
    points =
      corners
      |> Enum.map(fn {x, y} -> "#{x},#{y}" end)
      |> Enum.join(" ")

    XmlBuilder.element(
      :polygon,
      %{
        points: points,
        fill: "none",
        stroke: "black",
        "stroke-width": "0.02"
      }
    )
  end

  def line_to_element(%Line{start: {x1, y1}, end: {x2, y2}}) do
    XmlBuilder.element(
      :line,
      %{
        x1: x1,
        y1: y1,
        x2: x2,
        y2: y2,
        stroke: "red",
        "stroke-width": "0.03"
      }
    )
  end

  def to_svg(elements, width \\ 200, height \\ 200, viewbox \\ "0 0 10 10") do
    svg =
      XmlBuilder.element(
        :svg,
        %{
          xmlns: "http://www.w3.org/2000/svg",
          width: width,
          height: height,
          viewBox: viewbox
        },
        elements
      )

    XmlBuilder.generate(svg)
  end
end
