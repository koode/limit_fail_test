defmodule LimitFailTest.Catalog.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :exported_at, :naive_datetime
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:title, :exported_at])
    |> validate_required([:title, :exported_at])
  end
end
