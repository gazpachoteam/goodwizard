defmodule Goodwizard.MixProject do
  use Mix.Project

  def project do
    [
      app: :goodwizard,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      dialyzer: [
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"},
        plt_add_apps: [:ex_unit, :mix],
        ignore_warnings: ".dialyzer_ignore.exs"
      ]
    ]
  end

  def cli do
    [
      preferred_envs: [check: :test, precommit: :test]
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Goodwizard.Application, []}
    ]
  end

  defp deps do
    [
      {:jido, "~> 2.1", override: true},
      {:jido_ai, github: "agentjido/jido_ai", branch: "main", override: true},
      {:jido_character, github: "agentjido/jido_character", branch: "main"},
      {:jido_browser, "~> 2.0", override: true},
      {:jido_messaging, path: "deps_vendored/jido_messaging", override: true},
      {:telegex, "~> 1.8"},
      {:finch, "~> 0.18"},
      {:plug, "~> 1.15"},
      {:plug_cowboy, "~> 2.7"},
      {:toml, "~> 0.7"},
      {:jason, "~> 1.4"},
      {:yaml_elixir, "~> 2.9"},
      {:dotenvy, "~> 1.1"},
      {:ex_json_schema, "~> 0.10"},
      {:uniq, "~> 0.6"},
      {:nebulex, "~> 2.6"},

      # Code Quality (dev/test only)
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:doctor, "~> 0.21", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:mimic, "~> 1.0", only: :test},
      {:faker, "~> 0.18", only: :test},
      {:benchee, "~> 1.3", only: :dev, runtime: false}
    ]
  end

  defp aliases do
    [
      check: [
        "compile --warnings-as-errors",
        "deps.unlock --unused",
        "format --check-formatted",
        "credo --strict",
        "doctor",
        "dialyzer",
        "test"
      ],
      precommit: ["check"]
    ]
  end
end
