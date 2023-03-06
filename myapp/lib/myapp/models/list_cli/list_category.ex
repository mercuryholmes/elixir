defmodule Myapp.Model.ListCategory do
  @doc """
  model list_category.
  """
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false

  @timestamps_opts [type: :utc_datetime_usec]
  schema "list_category" do
    field :name, :string
    timestamps(type: :utc_datetime_usec)
    has_many :list_item, Myapp.Model.ListItem
  end

  @doc """
  list_category changeset for registration.
  """
  def changeset(list_category, params) do
    IO.inspect params
    list_category
    |> cast(params, [:id, :name])
    |> validate_required([:name])
  end

end
