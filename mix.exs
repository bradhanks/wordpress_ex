defmodule WordpressEx.MixProject do
  use Mix.Project

  @version "0.1.0"
  @description """
  A Wordpress REST API wrapper
  """

  def project do
    [
      app: :wordpress_ex,
      version: @version,
      description: @description,
      elixir: "~> 1.4",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env()),
      docs: docs(),
      source_url: "https://github.com/tmock12/wordpress_ex"
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
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:httpoison, "~> 2.0"},
      {:jason, "~> 1.4.1"},
      {:mix_test_watch, "~> 0.5", only: :dev, runtime: false},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Taylor Mock"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/tmock12/wordpress_ex"}
    ]
  end

  def docs do
    [
      extras: ["README.md"],
      main: "readme"
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
