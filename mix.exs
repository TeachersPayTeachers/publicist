defmodule Publicist.Mixfile do
  use Mix.Project

  def project() do
    [app: :publicist,
     version: "1.0.0",
     elixir: "~> 1.0",
     name: "Publicist",
     description: description(),
     package: package(),
     source_url: "https://github.com/TeachersPayTeachers/publicist",
     deps: []]
  end

  defp description() do
    "Publicist allows developers to test def methods"
  end

  defp package() do
    [
      name: "publicist",
      files: ["lib", "mix.exs", "README.md", "LICENSE.md"],
      licenses: ["MIT"], # TODO: get signoff on license
      maintainers: ["Shanti Chellaram"],
      links: %{
        "GitHub" => "https://github.com/TeachersPayTeachers/publicist"
      }
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end
end
