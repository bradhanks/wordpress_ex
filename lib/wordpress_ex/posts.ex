defmodule WordpressEx.Posts do
  @moduledoc """
  Wordpress Post endpoints
  """

  import WordpressEx.Client, only: [get: 2]
  import WordpressEx.StructComposer, only: [compose: 2]
  alias WordpressEx.Model.Post

  @doc """
  Get a list of posts

  ## Examples:

      WordpressEx.Posts.list()
      WordpressEx.Posts.list(page: 2, per_page: 3)

  ## API Reference
  https://developer.wordpress.org/rest-api/reference/posts/#list-posts
  """
  def list(opts \\ []) do
    get("/posts", opts)
    |> handle_response(Post)
  end

  @doc """
  Get a single post from id

  ## Examples:

      WordpressEx.Posts.find(123)
      WordpressEx.Posts.find(123, context: "view")

  ## API Reference
  https://developer.wordpress.org/rest-api/reference/posts/#retrieve-a-post
  """
  def find(id, opts \\ []) when is_integer(id) do
    get("/posts/#{id}", opts)
    |> handle_response(Post)
  end

  defp handle_response({:ok, data}, struct) do
    compose(data, struct)
  end

  defp handle_response({:error, reason}, _struct) do
    {:error, reason}
  end
end
