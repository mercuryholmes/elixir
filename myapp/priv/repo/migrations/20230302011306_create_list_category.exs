defmodule Myapp.Repo.Migrations.CreateListCategory do
  use Ecto.Migration

  def change do
    create table(:list_category) do
        add :name, :string, size: 255, null: false

        timestamps()
    end
  end
end
