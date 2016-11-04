defmodule RumbleFix.Router do
  use RumbleFix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug RumbleFix.Auth, repo: RumbleFix.Repo #the plug that we created - file: web/controllers/auth.ex
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RumbleFix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    get "/watch/:id", WatchController, :show
    resources "/videos", VideoController
  end

  scope "/manage", RumbleFix do
    pipe_through [:browser, :authenticate_user]

  end

  # Other scopes may use custom stacks.
  # scope "/api", RumbleFix do
  #   pipe_through :api
  # end
end
