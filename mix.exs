defmodule Tacocat.MixProject do
  use Mix.Project

  @version "0.3.0"

  def project do
    [
      app: :tacocat,
      description:
        "Playful text manipulations and animations including Nyan Cat, upside down, backwards, and Bon Iver!",
      version: @version,
      package: package(),
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: [
        source_ref: "v#{@version}",
        logo: "docs/logo.png"
      ]
    ]
  end

  defp package do
    [
      maintainers: ["Everett Griffiths"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/fireproofsocks/tacocat"}
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
      {:ex_doc, "~> 0.22.6", only: [:dev, :test], runtime: false}
    ]
  end
end
