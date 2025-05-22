defmodule Product.RBSProducts do
  @moduledoc """
  The RBSProducts context.
  """

  import Ecto.Query, warn: false
  alias Product.Repo

  alias Product.RBSProducts.RBSProduct

  @doc """
  Returns the list of rbs_products.

  ## Examples

      iex> list_rbs_products()
      [%RBSProduct{}, ...]

  """
  def list_rbs_products do
    Repo.all(RBSProduct)
  end

  @doc """
  Gets a single rbs_product.

  Raises `Ecto.NoResultsError` if the Rbs product does not exist.

  ## Examples

      iex> get_rbs_product!(123)
      %RBSProduct{}

      iex> get_rbs_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_rbs_product!(id), do: Repo.get!(RBSProduct, id)

  @doc """
  Creates a rbs_product.

  ## Examples

      iex> create_rbs_product(%{field: value})
      {:ok, %RBSProduct{}}

      iex> create_rbs_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_rbs_product(attrs \\ %{}) do
    %RBSProduct{}
    |> RBSProduct.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a rbs_product.

  ## Examples

      iex> update_rbs_product(rbs_product, %{field: new_value})
      {:ok, %RBSProduct{}}

      iex> update_rbs_product(rbs_product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_rbs_product(%RBSProduct{} = rbs_product, attrs) do
    rbs_product
    |> RBSProduct.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a rbs_product.

  ## Examples

      iex> delete_rbs_product(rbs_product)
      {:ok, %RBSProduct{}}

      iex> delete_rbs_product(rbs_product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_rbs_product(%RBSProduct{} = rbs_product) do
    Repo.delete(rbs_product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking rbs_product changes.

  ## Examples

      iex> change_rbs_product(rbs_product)
      %Ecto.Changeset{data: %RBSProduct{}}

  """
  def change_rbs_product(%RBSProduct{} = rbs_product, attrs \\ %{}) do
    RBSProduct.changeset(rbs_product, attrs)
  end
end
