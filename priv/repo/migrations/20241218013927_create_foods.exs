defmodule SimplePos.Repo.Migrations.CreateFoods do
  use Ecto.Migration

  def change do
    create table(:foods, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :price, :decimal
      add :unit, :string
      add :desc, :string
      add :series_id, references(:series, type: :binary_id)

      timestamps(type: :utc_datetime)
    end
  end
end
