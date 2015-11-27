defmodule Hova.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  def start_link do
    Plug.Adapters.Cowboy.http __MODULE__, []
  end

  get "/" do
    send_resp(conn, 200, "H.O.V.A")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
