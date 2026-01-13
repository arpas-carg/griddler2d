defmodule Griddler2d.MixProject do
  use Mix.Project

  @version "0.1.2"

  def project do
    [
      app: :griddler2d,
      version: @version,
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      description: description(),
      package: package()
    ]
  end

  defp description do
    "Helpers"
  end

  defp package() do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/arpas-carg/griddler2d"}
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
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:kino, "~> 0.18.0", only: :dev},
      {:geo, "~> 4.1.0"},
      {:xml_builder, "~> 2.1"}
    ]
  end

  defp aliases do
    [
      wv: ["Griddler2D -awv"]
    ]
  end
end
