defmodule Hova.Router do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  def start_link do
    Plug.Adapters.Cowboy.http __MODULE__, []
  end

  get "/" do
    :random.seed(:os.timestamp)
    send_resp(conn, 200, Hova.Template.index(Hova.Sentence.get_paragraph))
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
