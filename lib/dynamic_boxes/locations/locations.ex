defmodule DynamicBoxes.Locations do
  import Ecto.{Query, Changeset}, warn: false
  alias DynamicBoxes.Repo
  alias DynamicBoxes.Locations.{City,Country}

  def list_countries do
    Repo.all(Country)
  end

  def list_cities_by_country() do
    from(x in Country, limit: 1)
    |> Repo.one()
    |> list_cities_by_country()
  end

  def list_cities_by_country(%Country{id: id}), do: list_cities_by_country(id)
  def list_cities_by_country(country_id) do
    Repo.all(from c in City, where: c.country_id == ^country_id)
  end

  def get_city(id) do
    City
    |> Repo.get(id)
    |> Repo.preload([:country])
  end
end
