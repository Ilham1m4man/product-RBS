defmodule Product.Repo.Migrations.CreateRbsProducts do
  use Ecto.Migration

  def change do
    create table(:rbs_products) do
      add :name, :string
      add :price_idr, :integer

      timestamps(type: :utc_datetime)
    end

    create unique_index(:rbs_products, [:name])
  end
end
