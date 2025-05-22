defmodule Product.RBSProducts.RBSProduct do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rbs_products" do
    field :name, :string
    field :price_idr, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(rbs_product, attrs) do
    rbs_product
    |> cast(attrs, [:name, :price_idr])
    |> validate_required([:name, :price_idr])
    |> unique_constraint(:name)
  end
end
