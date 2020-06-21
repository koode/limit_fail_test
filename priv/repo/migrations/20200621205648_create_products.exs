defmodule LimitFailTest.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :title, :string
      add :exported_at, :naive_datetime

      timestamps()
    end

  end
end
