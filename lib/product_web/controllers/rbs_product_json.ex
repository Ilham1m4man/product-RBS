defmodule ProductWeb.RBSProductJSON do
  alias Product.RBSProducts.RBSProduct

  @doc """
  Renders a list of rbs_products.
  """
  def index(%{rbs_products: rbs_products}) do
    %{data: for(rbs_product <- rbs_products, do: data(rbs_product))}
  end

  @doc """
  Renders a single rbs_product.
  """
  def show(%{rbs_product: rbs_product}) do
    %{data: data(rbs_product)}
  end

  defp data(%RBSProduct{} = rbs_product) do
    %{
      id: rbs_product.id,
      name: rbs_product.name,
      price_idr: rbs_product.price_idr
    }
  end
end
