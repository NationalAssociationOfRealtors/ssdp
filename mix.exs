defmodule Ssdp.Mixfile do
  use Mix.Project

  def project do
    [app: :ssdp,
     version: "0.1.2",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
        applications: [:logger, :httpoison, :sweet_xml, :xmerl],
        mod: {SSDP, []}
    ]
  end

  def description do
      """
      Discover devices on your network that use the SSDP (Simple Service Discovery Protocol)
      """
  end

  def package do
    [
      name: :ssdp,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Christopher Steven Coté"],
      licenses: ["Apache License 2.0"],
      links: %{"GitHub" => "https://github.com/NationalAssociationOfRealtors/ssdp",
          "Docs" => "https://github.com/NationalAssociationOfRealtors/ssdp"}
    ]
  end

  defp deps do
    [
        {:sweet_xml, "~> 0.6.1"},
        {:httpoison, "~> 0.8.3"},
        {:poison, "~> 2.0"},
        {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
