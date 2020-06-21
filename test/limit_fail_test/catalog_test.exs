defmodule LimitFailTest.CatalogTest do
  use LimitFailTest.DataCase, async: false

  alias LimitFailTest.Catalog
  alias LimitFailTest.Catalog.Product

  def assert_length(enumerable, length) do
    actual_length = length(enumerable)

    if actual_length != length do
      IO.inspect(enumerable, limit: :infinity, print_limit: :printable_limit, pretty: true)
    end

    assert actual_length == length
  end

  describe "Catalog" do
    setup do
      products =
        Repo.transaction(fn ->
          for i <- 1..30 do
            Repo.insert!(%Product{title: "Product #{i}"})
          end
        end)

      {:ok, products: products}
    end

    for i <- 1..1000 do
      test "sometimes fails to limit result #{i}" do
        products = Catalog.products_to_export(10)
        assert_length(products, 10)
      end
    end
  end
end
