defmodule NerveWeb.PageController do
  use NerveWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
