defmodule ShopWeb.ApiContollerJSON do
  def index(%{products: products}) do
    %{products: products}
  end
end
