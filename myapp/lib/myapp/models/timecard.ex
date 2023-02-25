defmodule Myapp.Model.TimeCard do
  use Ecto.Schema
  use Timex
  import Ecto.Changeset
  import Ecto.Query, warn: false

  schema "timecard" do
    field :date, :date
    field :start_time, :time, default: nil
    field :end_time, :time, default: nil
    field :weekday, :integer
    timestamps(type: :utc_datetime_usec)
  end

  @doc """
  A time changeset for registration.
  """
  def changeset(time, attrs) do
    time
    |> cast(attrs, [:date, :start_time, :end_time, :weekday])
    |> validate_required(:date)
    |> unsafe_validate_unique(:date, Myapp.Repo, message: "already registered.")
    |> validate_required(:weekday)
    |> validate_number(:weekday, greater_than_or_equal_to: 1, less_than_or_equal_to: 7)
  end

end
