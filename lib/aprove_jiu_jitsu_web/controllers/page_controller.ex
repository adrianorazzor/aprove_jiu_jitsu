defmodule AproveJiuJitsuWeb.PageController do
  use AproveJiuJitsuWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
