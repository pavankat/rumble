defmodule RumbleFix.VideoTest do
  use RumbleFix.ModelCase

  alias RumbleFix.Video

  @valid_attrs %{" url": "some content", description: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Video.changeset(%Video{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Video.changeset(%Video{}, @invalid_attrs)
    refute changeset.valid?
  end
end
