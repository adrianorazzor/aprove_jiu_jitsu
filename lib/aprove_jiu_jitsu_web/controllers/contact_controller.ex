defmodule AproveJiuJitsuWeb.ContactController do
  use AproveJiuJitsuWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def create(conn, _params) do
    # Handle form submission here
    # For now, we'll just redirect back to the contact page
    conn
    |> put_flash(:info, "Thank you for your message!")
    |> redirect(to: ~p"/contact")
  end
end
