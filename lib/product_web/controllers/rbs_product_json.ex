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
    %{data: singularData(rbs_product)}
  end

  defp data(%RBSProduct{} = rbs_product) do
    %{
      id: rbs_product.id,
      name: rbs_product.name,
      price_idr: rbs_product.price_idr,
    }
  end

  defp singularData(%RBSProduct{} = rbs_product) do
    url = "https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies/usd.json"
    headers = []

    usd_rates = Poison.Parser.parse!(HTTPoison.get!(url, headers).body, %{keys: :atoms}).usd.idr
    %{
      id: rbs_product.id,
      name: rbs_product.name,
      price_idr: rbs_product.price_idr,
      price_usd: rbs_product.price_idr/usd_rates
    }
  end
end
