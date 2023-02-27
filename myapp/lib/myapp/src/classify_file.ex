
defmodule ClassifyFile do

  @path "./"
  @pattern %{"\.md$" => "md"} # {Regex => Directory}

  def exec() do
    File.ls!(@path)
    |> Enum.each(&classify(&1))
  end

  defp classify(file) do
      Enum.map(@pattern, fn ({pattern, directory}) ->
          dest = Path.join(@path, directory)
          File.mkdir_p!(dest)
          if file =~ Regex.compile!(pattern) do
            File.rename(file, Path.join(dest, file))
            IO.puts "「#{file}」を「#{directory}」フォルダへ移動しました。"
          end
      end)
  end

end
