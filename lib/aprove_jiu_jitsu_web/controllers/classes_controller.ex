defmodule AproveJiuJitsuWeb.ClassesController do
  use AproveJiuJitsuWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
