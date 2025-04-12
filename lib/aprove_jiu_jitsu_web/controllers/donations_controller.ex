defmodule AproveJiuJitsuWeb.DonationsController do
  use AproveJiuJitsuWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
