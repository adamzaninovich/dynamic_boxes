defmodule DynamicBoxesWeb.LocationsController do
  use DynamicBoxesWeb, :controller
  alias DynamicBoxes.Locations

  def index(conn, _params) do
    conn
    |> assign(:countries, Locations.list_countries())
    # |> assign(:cities, Locations.list_cities_by_country())
    |> render("index.html")
  end

  def show(conn, %{"trip" => %{"city_id" => city_id}}) do
    conn
    |> assign(:city, Locations.get_city(city_id))
    |> render("show.html")
  end

  def refresh_cities(conn, %{"country_id" => country_id}) do
    conn
    |> assign(:cities, Locations.list_cities_by_country(country_id))
    |> render("refresh_cities.js")
  end
end
