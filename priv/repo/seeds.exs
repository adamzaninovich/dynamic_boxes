# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DynamicBoxes.Repo.insert!(%DynamicBoxes.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias DynamicBoxes.Repo
alias DynamicBoxes.Locations.{City,Country}

Repo.insert!(%Country{
  name: "france",
  cities: [
    %City{name: "paris"},
    %City{name: "nice"}
  ]
})

Repo.insert!(%Country{
  name: "italy",
  cities: [
    %City{name: "rome"},
    %City{name: "venice"}
  ]
})
