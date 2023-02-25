defmodule TimeCard do
  @moduledoc """
  Timecard module.
  """

  import Ecto.Query, warn: false
  alias Myapp.Repo
  alias Myapp.Model.TimeCard

  @doc """
  Clock in.
  """
  def clock_in() do
    save_time(:register, %{date: get_date(), start_time: get_time(), weekday: get_weekday()})
  end

  @doc """
  Clock out.
  """
  def clock_out() do
    today = get_date()
    record = get_record_one_by_date(today)
    if record do
      save_time(:update, record, %{end_time: get_time()})
    else
      save_time(:register, %{date: today, end_time: get_time(), weekday: get_weekday()})
    end
  end

  defp save_time(:register, param) do
    case register_time(param) do
      {:ok, _time}  -> {:ok, "save time card successfully"}
      {:error, %Ecto.Changeset{} = changeset} -> {:error, changeset.errors}
    end
  end

  defp save_time(:update, time, param) do
    case update_time(time, param) do
      {:ok, _time}  -> {:ok, "update time card successfully"}
      {:error, %Ecto.Changeset{} = changeset} -> {:error, changeset.errors}
    end
  end

  defp register_time(attrs) do
    %TimeCard{}
    |> TimeCard.changeset(attrs)
    |> Repo.insert()
  end

  defp update_time(%TimeCard{} = time, attrs) do
    time
    |> TimeCard.changeset(attrs)
    |> Repo.update()
  end

  defp get_record_one_by_date(date) do
    TimeCard
    |> where(date: ^date)
    |> Repo.one()
  end

  defp get_date() do Timex.today("Asia/Tokyo") end
  defp get_time() do Timex.now("Asia/Tokyo") |> Timex.format!("%T%:z", :strftime) end
  defp get_weekday() do Timex.today("Asia/Tokyo") |> Timex.weekday() end
end
