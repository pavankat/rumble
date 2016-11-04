defmodule RumbleFix.CatTest do
  use RumbleFix.ModelCase

  alias RumbleFix.Cat

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Cat.changeset(%Cat{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Cat.changeset(%Cat{}, @invalid_attrs)
    refute changeset.valid?
  end
end
