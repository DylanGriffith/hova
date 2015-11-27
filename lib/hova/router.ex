defmodule Hova.Router do
  use Plug.Router

  @index File.read!("./lib/templates/index.html.eex")

  plug :match
  plug :dispatch

  def start_link do
    Plug.Adapters.Cowboy.http __MODULE__, []
  end

  get "/" do
    send_resp(conn, 200, EEx.eval_string(@index))
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
