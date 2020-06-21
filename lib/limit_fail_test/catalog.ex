defmodule LimitFailTest.Catalog do
  import Ecto.Query, only: [from: 2]

  alias LimitFailTest.{Repo, Catalog.Product}

  @spec products_to_export(non_neg_integer()) :: [Product.t()]
  def products_to_export(limit) do
    query =
      from(product in Product,
        where: is_nil(product.exported_at),
        lock: "FOR NO KEY UPDATE SKIP LOCKED",
        order_by: [asc: :id],
        limit: ^limit
      )

    update_query =
      from product in Product,
        select: product,
        join: p in subquery(query),
        on: p.id == product.id

    update_query
    |> Repo.update_all(set: [exported_at: NaiveDateTime.utc_now()])
    |> case do
      {_updates, products} -> products
    end
  end
end
