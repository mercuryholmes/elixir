
defmodule List.CLI do
  @moduledoc """
  List CLI module.
  """

  import Ecto.Query, warn: false
  alias Myapp.Repo
  alias Myapp.Model.ListCategory
  alias Myapp.Model.ListItem

  @doc """
  main.
  """
  def main() do
    list_category
  end

  defp list_category() do
    show_all_list_categories
    input = IO.gets "[1]select list [2]add list [3]delete list > "
    case preprocess(input) do
        "1" ->
          list_category
        "2" ->
          name = IO.gets "name > "
          params = %{name: preprocess(name)}
          |> add_list_category()
        "3" ->
          list_category
        _ ->
          list_category
    end
  end

  defp show_all_list_categories() do 
    IO.puts "id name"
    get_all_list_categories
    |> Enum.map(fn(v)->
        IO.puts "#{v.id}  #{v.name}"
        end
    )
  end

  defp preprocess(str) do str |> String.trim_trailing() end

  defp get_all_list_categories() do Repo.all(ListCategory) end

  defp add_list_category(params) do
    case insert_list_category(params) do
      {:ok, _}  -> {:ok, "success"}
      {:error, %Ecto.Changeset{} = changeset} -> {:error, changeset.errors}
    end
  end

  defp insert_list_category(params) do
    %ListCategory{}
    |> ListCategory.changeset(params)
    |> Repo.insert()
  end

end
