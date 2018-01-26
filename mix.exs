defmodule Publicist.Mixfile do
  use Mix.Project

  def project() do
    [app: :publicist,
     version: "1.0.2",
     elixir: "~> 1.0",
     name: "Publicist",
     description: "Publicist allows developers to test private (defp) functions",
     package: package(),
     source_url: "https://github.com/TeachersPayTeachers/publicist",
     deps: [{:ex_doc, "0.18.1", only: :dev, runtime: false}],
     docs: docs()]
  end

  defp package() do
    [
      name: "publicist",
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      licenses: ["MIT"],
      maintainers: ["Shanti Chellaram"],
      links: %{
        "GitHub" => "https://github.com/TeachersPayTeachers/publicist"
      }
    ]
  end

  defp docs() do
    [
      main: "Publicist",
      extras: ["README.md"],
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end
end
