defmodule NerveWeb.Router do
  use NerveWeb, :router

  # pipeline :browser do
  #   plug :accepts, ["html"]
  #   plug :fetch_session
  #   plug :fetch_flash
  #   plug :protect_from_forgery
  #   plug :put_secure_browser_headers
  # end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: NerveWeb.Schema, json_codec: Jason

    forward "/", Absinthe.Plug,
      schema: NerveWeb.Schema, json_codec: Jason
  end

  # scope "/", NerveWeb do
  #   pipe_through :browser

  #   get "/", PageController, :index
  # end

  # Other scopes may use custom stacks.
  # scope "/api", NerveWeb do
  #   pipe_through :api
  # end
end
