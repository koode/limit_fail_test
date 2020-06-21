defmodule LimitFailTestWeb.Router do
  use LimitFailTestWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LimitFailTestWeb do
    pipe_through :api
  end
end
