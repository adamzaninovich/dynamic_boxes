defmodule DynamicBoxes.Locations.City do
  use Ecto.Schema
  import Ecto.Changeset
  alias DynamicBoxes.Locations.{City,Country}


  schema "cities" do
    field :name, :string
    belongs_to :country, Country

    timestamps()
  end

  @doc false
  def changeset(%City{} = city, attrs) do
    city
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
