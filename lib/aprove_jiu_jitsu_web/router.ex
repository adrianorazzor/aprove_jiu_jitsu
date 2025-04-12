defmodule AproveJiuJitsuWeb.Router do
  use AproveJiuJitsuWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {AproveJiuJitsuWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AproveJiuJitsuWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/about", AboutController, :index
    get "/impact", ImpactController, :index
    get "/classes", ClassesController, :index
    get "/competitions", CompetitionsController, :index
    get "/donations", DonationsController, :index
    get "/sponsors", SponsorsController, :index
    get "/blog", BlogController, :index
    get "/blog/:id", BlogController, :show
    get "/contact", ContactController, :index
    post "/contact", ContactController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", AproveJiuJitsuWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:aprove_jiu_jitsu, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: AproveJiuJitsuWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
