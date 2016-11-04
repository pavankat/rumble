defmodule RumbleFix.WatchView do
  use RumbleFix.Web, :view

  # youtube urls come in many different formats so we use a reg expression to get the video id from the url
  def player_id(video) do
    ~r{^.*(?:youtu\.be/|\w+/|v=)(?<id>[^#&?]*)}
    |> Regex.named_captures(video.url)
    |> get_in(["id"])
  end
end
