defmodule Hova.Sentence do
  def start_link do
    {:ok, agent} = Agent.start_link(fn -> [] end, name: __MODULE__)

    Agent.update(agent, fn _ -> Hova.Data.sentences end)

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
