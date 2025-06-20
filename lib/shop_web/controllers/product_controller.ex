defmodule ShopWeb.ProductController do
  use ShopWeb, :controller
  alias Shop.Products

  # @products [
  #   %{id: "1", name: "God of war"},
  #   %{id: "2", name: "Skyrim"},
  #   %{id: "3", name: "Aliens"}
  # ]

  def index(conn, _params) do
    # TODO: Refactor products
    products = Products.list_products()

    conn
    |> assign(:products, products)
    |> render(:index)
  end

  def show(conn, %{"slug" => slug}) do
    product = Products.find_product_by_slug(slug)

    conn
    |> assign(:product, product)
    |> render(:show)
  end
end
