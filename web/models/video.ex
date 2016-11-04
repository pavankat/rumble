defmodule RumbleFix.Video do
  use RumbleFix.Web, :model

  @primary_key {:id, RumbleFix.Permalink, autogenerate: true}
  schema "videos" do
    field :url, :string
    field :title, :string
    field :description, :string
    field :slug, :string
    belongs_to :user, RumbleFix.User
    belongs_to :category, RumbleFix.Category
    has_many :annotations, RumbleFix.Annotation

    timestamps()
  end

  @required_fields ~w(url title description)
  @optional_fields ~w(category_id)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> slugify_title()
    |> assoc_constraint(:category)

    #That assoc_constraint converts foreign-key constraint errors into human-readable error messages and guarantees that a video is created only if the category exists in the database.
  end

  defp slugify_title(changeset) do
    if title = get_change(changeset, :title) do
      put_change(changeset, :slug, slugify(title))
    else
      changeset
    end
  end

  defp slugify(str) do
    str
    |> String.downcase()
    |> String.replace(~r/[^\w-]+/u, "-")
  end
end

# override the default to_param method - I think
defimpl Phoenix.Param, for: RumbleFix.Video do
  def to_param(%{slug: slug, id: id}) do
    "#{id}-#{slug}"
  end
end
