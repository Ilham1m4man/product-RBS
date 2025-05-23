defmodule ExchangeRate do
  @default "https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies/usd.min.json"
  def usd_rate(url \\ @default) do
    headers = []
    if HTTPoison.get!(@default, headers).status_code != 200 do
      usd_rate("https://latest.currency-api.pages.dev/v1/currencies/usd.min.json")
    end

    if HTTPoison.get!(url, headers).status_code != 200 do
      usd_rate("https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies/usd.json")
    end

    Poison.Parser.parse!(HTTPoison.get!(url, headers).body, %{keys: :atoms}).usd.idr
  end
end
