defmodule DynamicBoxesWeb.Router do
  use DynamicBoxesWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", DynamicBoxesWeb do
    pipe_through :browser # Use the default browser stack

    get "/", LocationsController, :index
    get "/location", LocationsController, :show
    get "/refresh_cities/:country_id", LocationsController, :refresh_cities
  end
end
