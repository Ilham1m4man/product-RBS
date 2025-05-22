defmodule Product.RBSProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Product.RBSProducts` context.
  """

  @doc """
  Generate a unique rbs_product name.
  """
  def unique_rbs_product_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a rbs_product.
  """
  def rbs_product_fixture(attrs \\ %{}) do
    {:ok, rbs_product} =
      attrs
      |> Enum.into(%{
        name: unique_rbs_product_name(),
        price_idr: 42
      })
      |> Product.RBSProducts.create_rbs_product()

    rbs_product
  end
end
