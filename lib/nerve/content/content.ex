defmodule Nerve.Content do
  import Ecto.Query

  alias Nerve.{Repo, Content}

  def list_posts(user, %{date: date}) do
    from(t in Content.Post,
      where: t.user_id == ^user.id,
      where: fragment("date_trunc('day', ?)", t.published_at) == type(^date, :date),
      preload: :user)
    |> Repo.all
  end
  def list_posts(user, _) do
    from(t in Content.Post, where: t.user_id == ^user.id, preload: :user)
    |> Repo.all
  end
  def list_posts do
    from(t in Content.Post, preload: :user)
    |> Repo.all
  end

  def find_post(id) do
    Repo.get(Content.Post, id) |> Repo.preload(:user)
  end

end
