defmodule SimplePos.Food do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "foods" do
    field :name, :string
    field :unit, :string
    field :desc, :string
    field :price, :decimal
    belongs_to :series, SimplePos.Series

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(food, attrs) do
    food
    |> cast(attrs, [:name, :price, :unit, :desc])
    |> validate_required([:name, :price, :unit])
  end
end
