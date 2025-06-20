defmodule ShopWeb.ProductHTML do
  alias Shop.Products.Product
  use ShopWeb, :html
  # gives views for product section
  embed_templates "product_html/*"

  attr :product, Product, required: true

  def product(assigns) do
    ~H"""
    <.link href={~p"/product/#{@product.slug}"} class="block">{@product.name}</.link>
    """
  end
end
