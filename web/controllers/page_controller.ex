defmodule RumbleFix.PageController do
  use RumbleFix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
