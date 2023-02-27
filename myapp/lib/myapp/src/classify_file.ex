
defmodule ClassifyFile do

  @path "./"
  @pattern %{"\.md$" => "md"} # {Regex => Directory}

  def exec() do
    File.ls!(@path) |> Enum.map(&classify(&1))
  end

  defp classify(file) do
      Enum.map(@pattern, fn ({pattern, directory_name}) ->
          if file =~ Regex.compile!(pattern) do
              mkdir_if_not_exists("#{@path}#{directory_name}")
              File.rename("#{@path}#{file}", "#{@path}#{directory_name}/#{file}")
          end
        end
      )
  end

  defp mkdir_if_not_exists(directory) do
      unless File.exists?(directory) do File.mkdir!(directory) end
  end

end
