defmodule RumbleFix.AnnotationView do
  use RumbleFix.Web, :view

  def render("annotation.json", %{annotation: ann}) do
    %{
      id: ann.id,
      body: ann.body,
      at: ann.at,
      user: render_one(ann.user, RumbleFix.UserView, "user.json")
    }
  end
end
