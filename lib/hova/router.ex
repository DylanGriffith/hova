defmodule Hova.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  def start_link do
    Plug.Adapters.Cowboy.http __MODULE__, []
  end

  get "/" do
    {:ok, page} = File.read("./lib/templates/index.html.eex")
    send_resp(conn, 200, EEx.eval_string(page))
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
