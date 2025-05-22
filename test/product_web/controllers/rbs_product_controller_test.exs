defmodule ProductWeb.RBSProductControllerTest do
  use ProductWeb.ConnCase

  import Product.RBSProductsFixtures

  alias Product.RBSProducts.RBSProduct

  @create_attrs %{
    name: "some name",
    price_idr: 42
  }
  @update_attrs %{
    name: "some updated name",
    price_idr: 43
  }
  @invalid_attrs %{name: nil, price_idr: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all rbs_products", %{conn: conn} do
      conn = get(conn, ~p"/api/rbs_products")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create rbs_product" do
    test "renders rbs_product when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/rbs_products", rbs_product: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/rbs_products/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name",
               "price_idr" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/rbs_products", rbs_product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update rbs_product" do
    setup [:create_rbs_product]

    test "renders rbs_product when data is valid", %{conn: conn, rbs_product: %RBSProduct{id: id} = rbs_product} do
      conn = put(conn, ~p"/api/rbs_products/#{rbs_product}", rbs_product: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/rbs_products/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some updated name",
               "price_idr" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, rbs_product: rbs_product} do
      conn = put(conn, ~p"/api/rbs_products/#{rbs_product}", rbs_product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete rbs_product" do
    setup [:create_rbs_product]

    test "deletes chosen rbs_product", %{conn: conn, rbs_product: rbs_product} do
      conn = delete(conn, ~p"/api/rbs_products/#{rbs_product}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/rbs_products/#{rbs_product}")
      end
    end
  end

  defp create_rbs_product(_) do
    rbs_product = rbs_product_fixture()
    %{rbs_product: rbs_product}
  end
end
