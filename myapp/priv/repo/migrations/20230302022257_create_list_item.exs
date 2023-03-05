defmodule Myapp.Repo.Migrations.CreateListItem do
  use Ecto.Migration

  def change do
    create table(:list_item) do
        add :name, :string, size: 255, null: false
        add :No, :integer, null: false
        add :description, :text, null: true
        add :status, :boolean, default: true, null: false 
        add :list_category_id, references(:list_category, on_delete: :delete_all), null: false 

        timestamps()
    end
  end
end
