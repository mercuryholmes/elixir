
defmodule ExportTimeCardCSV do
  @moduledoc """
  Export timecard csv module.
  """

  import Ecto.Query, warn: false
  alias Myapp.Repo
  alias Myapp.Model.TimeCard

  @doc """
  export.
  """
  def export() do
    file = file_name() |> File.open!([:write, :utf8])
    start_date = get_date() |> Date.beginning_of_month()
    end_date = get_date() |> Date.end_of_month()
    get_record_list(start_date, end_date)
    |> Enum.map(&
      %{
        "日付": &1.date,
        "曜日": Map.get(day_name(), &1.weekday),
        "開始時刻": &1.start_time,
        "終了時刻": &1.end_time,
      }
    )
    |> CSV.encode(headers: headers())
    |> Enum.each(&IO.write(file, &1))
  end

  defp file_name() do
    file_name = get_date() |> Timex.format!("{YYYY}{M}")
    "#{file_name}.csv"
  end

  defp get_record_list(start_date, end_date) do
    query = from t in TimeCard, select: map(t, ^fields()), where: t.date >= ^start_date, where: t.date <= ^end_date, order_by: [asc: t.date]
    Repo.all(query)
  end

  defp fields do [:date, :weekday, :start_time, :end_time] end

  defp headers do [:"日付", :"曜日", :"開始時刻", :"終了時刻"] end

  defp day_name do %{1 => "月", 2 => "火", 3 => "水", 4 => "木", 5 => "金", 6 => "土", 7 => "日"} end

  defp get_date do Timex.today("Asia/Tokyo") end

end
