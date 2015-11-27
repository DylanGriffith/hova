defmodule Hova.Sentence do
  def start_link do
    {:ok, agent} = Agent.start_link(fn -> [] end, name: __MODULE__)

    {:ok, all_text} = File.read("./lib/lyrics.txt")

    sentences = String.split(all_text, "\n")
      |> Enum.map(fn (s) -> String.strip(s) end)
      |> Enum.filter(fn (s) -> String.length(s) > 5 end)

    Agent.update(agent, fn _ -> sentences end)

    {:ok, agent}
  end

  def get_paragraph do
    all
      |> Enum.shuffle
      |> Enum.take(20)
      |> Enum.join(". ")
  end

  def all do
    Agent.get(__MODULE__, fn (all) -> all end)
  end
end
