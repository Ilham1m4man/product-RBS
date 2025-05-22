defmodule Product.RBSProductsTest do
  use Product.DataCase

  alias Product.RBSProducts

  describe "rbs_products" do
    alias Product.RBSProducts.RBSProduct

    import Product.RBSProductsFixtures

    @invalid_attrs %{name: nil, price_idr: nil}

    test "list_rbs_products/0 returns all rbs_products" do
      rbs_product = rbs_product_fixture()
      assert RBSProducts.list_rbs_products() == [rbs_product]
    end

    test "get_rbs_product!/1 returns the rbs_product with given id" do
      rbs_product = rbs_product_fixture()
      assert RBSProducts.get_rbs_product!(rbs_product.id) == rbs_product
    end

    test "create_rbs_product/1 with valid data creates a rbs_product" do
      valid_attrs = %{name: "some name", price_idr: 42}

      assert {:ok, %RBSProduct{} = rbs_product} = RBSProducts.create_rbs_product(valid_attrs)
      assert rbs_product.name == "some name"
      assert rbs_product.price_idr == 42
    end

    test "create_rbs_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = RBSProducts.create_rbs_product(@invalid_attrs)
    end

    test "update_rbs_product/2 with valid data updates the rbs_product" do
      rbs_product = rbs_product_fixture()
      update_attrs = %{name: "some updated name", price_idr: 43}

      assert {:ok, %RBSProduct{} = rbs_product} = RBSProducts.update_rbs_product(rbs_product, update_attrs)
      assert rbs_product.name == "some updated name"
      assert rbs_product.price_idr == 43
    end

    test "update_rbs_product/2 with invalid data returns error changeset" do
      rbs_product = rbs_product_fixture()
      assert {:error, %Ecto.Changeset{}} = RBSProducts.update_rbs_product(rbs_product, @invalid_attrs)
      assert rbs_product == RBSProducts.get_rbs_product!(rbs_product.id)
    end

    test "delete_rbs_product/1 deletes the rbs_product" do
      rbs_product = rbs_product_fixture()
      assert {:ok, %RBSProduct{}} = RBSProducts.delete_rbs_product(rbs_product)
      assert_raise Ecto.NoResultsError, fn -> RBSProducts.get_rbs_product!(rbs_product.id) end
    end

    test "change_rbs_product/1 returns a rbs_product changeset" do
      rbs_product = rbs_product_fixture()
      assert %Ecto.Changeset{} = RBSProducts.change_rbs_product(rbs_product)
    end
  end
end
