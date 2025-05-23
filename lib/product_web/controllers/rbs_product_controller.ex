defmodule ProductWeb.RBSProductController do
  use ProductWeb, :controller

  require Logger
  alias Product.Repo
  alias Product.RBSProducts
  alias Product.RBSProducts.RBSProduct

  action_fallback ProductWeb.FallbackController

  def index(conn, params) do
    rbs_products = RBSProduct |> Repo.paginate(params)
    render(conn, :index, rbs_products: rbs_products.entries)
  end

  def create(conn, %{"rbs_product" => rbs_product_params}) do
    with {:ok, %RBSProduct{} = rbs_product} <- RBSProducts.create_rbs_product(rbs_product_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/products/#{rbs_product}")
      |> render(:show, rbs_product: rbs_product)
    end
  end

  def show(conn, %{"id" => id}) do
    rbs_product = RBSProducts.get_rbs_product!(id)
    render(conn, :show, rbs_product: rbs_product)
  end

  def update(conn, %{"id" => id, "rbs_product" => rbs_product_params}) do
    rbs_product = RBSProducts.get_rbs_product!(id)

    with {:ok, %RBSProduct{} = rbs_product} <- RBSProducts.update_rbs_product(rbs_product, rbs_product_params) do
      render(conn, :show, rbs_product: rbs_product)
    end
  end

  def delete(conn, %{"id" => id}) do
    rbs_product = RBSProducts.get_rbs_product!(id)

    with {:ok, %RBSProduct{}} <- RBSProducts.delete_rbs_product(rbs_product) do
      send_resp(conn, :no_content, "")
    end
  end
end
