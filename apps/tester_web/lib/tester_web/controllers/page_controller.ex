defmodule TesterWeb.PageController do
  use TesterWeb, :controller
  alias Phoenix.LiveView
  
  def index(conn, _params) do
    conn
      |> LiveView.Controller.live_render(TesterWeb.PageLiveView, session: %{})
  end
end
