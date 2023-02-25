defmodule Mix.Tasks.Work.Start do
  @moduledoc "The work mix task: `mix help work.start`"
  use Mix.Task

  @shortdoc "Start work."
  def run(_) do
    Mix.Task.run("app.start")
    Mix.shell().info("start work!")
    TimeCard.clock_in()
    |> IO.inspect
  end
end
