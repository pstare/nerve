defmodule Nerve.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string, unique: true

      timestamps()
    end

  end
end
