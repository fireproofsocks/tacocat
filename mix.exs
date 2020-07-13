defmodule Tacocat.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :tacocat,
      description: "Playful text manipulations including upside down and backwards",
      version: @version,
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: [
        source_ref: "v#{@version}",
        logo: "docs/logo.png"
      ]
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
      {:ex_doc, "~> 0.22", only: [:dev, :test], runtime: false}
    ]
  end
end
