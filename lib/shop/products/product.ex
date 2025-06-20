defmodule Shop.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Jason.Encoder, only: [:name, :console, :slug]}
  schema "products" do
    field :name, :string
    field :console, Ecto.Enum, values: [:pc, :xbox, :nintendo, :playstation]
    field :slug, :string

    timestamps(type: :utc_datetime)
  end

  @spec changeset(
          {map(),
           %{
             optional(atom()) =>
               atom()
               | {:array | :assoc | :embed | :in | :map | :parameterized | :supertype | :try,
                  any()}
           }}
          | %{
              :__struct__ => atom() | %{:__changeset__ => any(), optional(any()) => any()},
              optional(atom()) => any()
            },
          :invalid | %{optional(:__struct__) => none(), optional(atom() | binary()) => any()}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :slug, :console])
    |> validate_required([:name, :slug, :console])
    |> unique_constraint(:slug)
  end
end
