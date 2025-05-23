defmodule Utils.ProductCache do
  @cachename :product_cache

  def get(key) do
    Cachex.get(@cachename, key)
  end

  def put(key, data) do
    Cachex.put(@cachename, key, data)
    Cachex.expire(@cachename, key, :timer.minutes(5))
  end

end
