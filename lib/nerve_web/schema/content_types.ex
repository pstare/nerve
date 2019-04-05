defmodule NerveWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string
    field :user, :user
    field :published_at, :naive_datetime
  end

end