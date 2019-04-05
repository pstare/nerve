defmodule NerveWeb.Resolvers.Content do

  def list_posts(%Nerve.Accounts.User{} = user, args, _resolution) do
    {:ok, Nerve.Content.list_posts(user, args)}
  end
  def list_posts(_parent, _args, _resolution) do
    {:ok, Nerve.Content.list_posts()}
  end

  def find_post(_parent, %{id: id}, _resolution) do
    case Nerve.Content.find_post(id) do
      nil ->
        {:error, "Post ID #{id} not found"}
      post ->
        {:ok, post}
    end
  end

  def create_post(_parent, args, %{context: %{current_user: user}}) do
    Nerve.Content.create_post(user, args)
  end
  def create_post(_parent, args, _resolution) do
    {:error, "Access denied"}
  end

end
