defmodule Inmana.Supplies.ExpirationNotification do
  alias Inmana.Supplies.{ExpirationEmail, GetByExpirationDate}
  alias Inmana.Mailer

  def send do
    data = GetByExpirationDate.call()
    Enum.each(data, fn {to_email, supplies} ->
      to_email
        |> ExpirationEmail.create(supplies)
        |> Mailer.deliver_later!()
    end)
  end
end
