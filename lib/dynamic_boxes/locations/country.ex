defmodule DynamicBoxes.Locations.Country do
  use Ecto.Schema
  import Ecto.Changeset
  alias DynamicBoxes.Locations.{City,Country}


  schema "countries" do
    field :name, :string
    has_many :cities, City

    timestamps()
  end

  @doc false
  def changeset(%Country{} = country, attrs) do
    country
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
