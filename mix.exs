defmodule Mangler.MixProject do
  use Mix.Project

 @project_url "https://github.com/rocketinsights/mangler"
  @version "0.2.0"

  def project do
    [
      app: :mangler,
      version: @version,
      elixir: "~> 1.10",
      description: "A collection of utilities to validate and transform strings with diacritics, unicode and ascii.",
      source_url: @project_url,
      homepage_url: @project_url,
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],
      docs: [main: "readme", extras: ["README.md"]],
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.10", only: :test},
      {:ex_doc, "~> 0.23", only: :dev, runtime: false},
      {:stream_data, "~> 0.5", only: :test}
    ]
  end

  defp package() do
    [
      maintainers: [
        "Chris Berube",
        "Jon Principe"
      ],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @project_url,
        "Rocket Insights" => "https://rocketinsights.com"
      }
    ]
  end

  defp aliases do
    [
      lint: ["credo"],
      setup: ["deps.get", "deps.compile", "compile"]
    ]
  end
end
