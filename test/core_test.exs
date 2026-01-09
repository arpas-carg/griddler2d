defmodule Griddler2D.CoreTest do
  use ExUnit.Case
  alias Griddler2D.Core

  test "build grid" do
    grid = Core.build_grid(2,2,1)
    assert length(grid) == 3
    assert length(hd(grid)) == 3
  end

  test "cells" do
    grid = Core.build_grid(2,2,1)
    cells = Core.cells(grid)
    assert length(cells) == 4
  end
end
