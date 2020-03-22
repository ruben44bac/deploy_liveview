defmodule TesterWeb.PageView do
  use TesterWeb, :view
end

defmodule TesterWeb.PageLiveView do
  use Phoenix.LiveView

  def render(assigns) do
    TesterWeb.PageView.render("index.html", assigns)
  end

  def mount(session, socket) do
    {:ok, socket}
  end
end
