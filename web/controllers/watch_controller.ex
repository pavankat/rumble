
defmodule RumbleFix.WatchController do
  use RumbleFix.Web, :controller
  alias RumbleFix.Video

  def show(conn, %{"id" => id}) do
    video = Repo.get!(Video, id)
    render conn, "show.html", video: video
  end
end
