defmodule Myapp.Model.ListItem do
  @doc """
  model ListItem.
  """
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false

  @timestamps_opts [type: :utc_datetime_usec]
  schema "list_item" do
    field :name, :string
    field :No, :integer
    field :description, :string
    field :status, :boolean, default: true
    timestamps(type: :utc_datetime_usec)
    belongs_to :list_category, Myapp.Model.ListCategory
  end

  @doc """
  list_item changeset for registration.
  """
  def changeset(list_item, params) do
    list_item
    |> cast(params, [:name, :No, :list_category_id])
    |> validate_required([:name, :No, :list_category_id])
  end

end
