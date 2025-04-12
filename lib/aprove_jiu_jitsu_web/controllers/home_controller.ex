defmodule AproveJiuJitsuWeb.HomeController do
  use AproveJiuJitsuWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
