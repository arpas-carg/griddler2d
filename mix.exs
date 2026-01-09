defmodule Griddler2d.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :griddler2d,
      version: @version,
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:geo, "~> 4.1.0", optional: true, only: :dev}
    ]
  end
end
