defmodule Chrip.Timeline.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :likes_counter, :integer, default: 0
    field :reposts_count, :integer, default: 0
    field :username, :string, default: "Diego"

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [ :body])
    |> validate_required([:username, :body, :likes_counter, :reposts_count])
    |> validate_length(:body , min: 2, max: 160)
  end
end
