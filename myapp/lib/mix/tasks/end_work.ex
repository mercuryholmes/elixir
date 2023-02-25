defmodule Mix.Tasks.Work.End do
  @moduledoc "The work mix task: `mix help work.end`"
  use Mix.Task

  @shortdoc "End work."
  def run(_) do
    Mix.Task.run("app.start")
    Mix.shell().info("end work!")
    TimeCard.clock_out()
    |> IO.inspect
  end
end
