defmodule Testo.Router do
  use Plug.Router

  plug(:match)

  plug(
    Plug.Session,
    store: :cookie,
    key: "session_keyyyyyyyyyyyyyyyyyyyysession_keyyyyyyyyyyyyyyyyyyyyyyyy",
    signing_salt: "signing_salt",
    encryption_salt: "encryption_salt",
    key_length: 64
  )

  plug(:put_secret_key_base)
  plug(:fetch_connection_session)
  plug(:dispatch)

  defp put_secret_key_base(conn, _) do
    put_in(conn.secret_key_base, "secret_key_base_secret_key_base_secret_key_base_secret_key_base_secret_key_base_secret_key_base_")
  end

  defp fetch_connection_session(conn, _) do
    fetch_session(conn)
  end

  get "/testo" do

    conn
    |> put_session(:flash, {:toto, :titi})
    |> put_resp_header("location", "/elsewhere")
    |> resp(302, "You are being redirected.")
  end
  get "/elsewhere" do
    {:toto, :titi} = get_session(conn, :flash)
    send_resp(conn, 200, "")
  end
end
