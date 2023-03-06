
defmodule Myapp.List.CLI do
  @moduledoc """
  List CLI module.
  """

  import Ecto.Query, warn: false
  alias Myapp.ListCategories

  def main() do
    list_category()
  end

  defp list_category() do
    show_all_list_categories()
    input = IO.gets "[1]select list [2]add list [3]delete list > "
    case preprocess(input) do
        "1" ->
  
          list_category()
        "2" ->
          name = IO.gets "name > "
          params = %{name: preprocess(name)}
          |> add_list_category()

          list_category()
        "3" ->
          list_id = IO.gets "delete id > "
          params = list_id |> preprocess() |> String.to_integer()
          |> delete_list_category()

          list_category()
        _ ->
          list_category()
    end
  end

  defp preprocess(str) do str |> String.trim_trailing() end

  defp show_all_list_categories() do 
    IO.puts "id name"
    ListCategories.get_all_list_categories()
    |> Enum.map(fn(v)->
        IO.puts "#{v.id}  #{v.name}"
        end
    )
  end

  defp add_list_category(params) do
    case ListCategories.insert_list_category(params) do
      {:ok, _}  -> {:ok, "success"}
      {:error, %Ecto.Changeset{} = changeset} -> {:error, changeset.errors}
    end
  end

  defp delete_list_category(params) do
    list_category = ListCategories.get_list_category!(params)
    case ListCategories.delete_list_category(list_category) do
      {:ok, _}  -> {:ok, "success"}
      {:error, %Ecto.Changeset{} = changeset} -> {:error, changeset.errors}
    end
  end

end
