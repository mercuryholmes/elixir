
defmodule Myapp.ListCategories do
  @moduledoc """
  ListCategories module.
  """

  import Ecto.Query, warn: false
  alias Myapp.Repo
  alias Myapp.Model.ListCategory

  def get_all_list_categories() do Repo.all(ListCategory) end

  def get_list_category!(id) do Repo.get!(ListCategory, id) end

  def insert_list_category(params) do
    %ListCategory{}
    |> ListCategory.changeset(params)
    |> Repo.insert()
  end

  def delete_list_category(%ListCategory{} = list_category) do
    Repo.delete(list_category)
  end

end
