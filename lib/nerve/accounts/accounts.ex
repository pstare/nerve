defmodule Nerve.Accounts do
  import Ecto.Query

  alias Nerve.{Repo, Accounts}

  def find_user(id) do
    Repo.get(Accounts.User, id)
  end

end
