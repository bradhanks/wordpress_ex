defmodule WordpressEx.Pages do
  @moduledoc """
  Wordpress Page endpoints
  """

  import WordpressEx.Client, only: [get: 2]
  import WordpressEx.StructComposer, only: [compose: 2]
  alias WordpressEx.Model.Page

  @doc """
  Get a list of pages

  ## Examples:

      WordpressEx.Pages.list()
      WordpressEx.Pages.list(page: 2, per_page: 3)

  ## API Reference
  https://developer.wordpress.org/rest-api/reference/pages/#list-pages
  """
  def list(opts \\ []) do
    get("/pages", opts)
    |> handle_response(Page)
  end

  @doc """
  Get a single page from id

  ## Examples:

      WordpressEx.Pages.find(123)
      WordpressEx.Pages.find(123, context: "edit")

  ## API Reference
  https://developer.wordpress.org/rest-api/reference/pages/#retrieve-a-page
  """
  def find(id, opts \\ []) when is_integer(id) do
    get("/pages/#{id}", opts)
    |> handle_response(Page)
  end

  defp handle_response({:ok, data}, struct) do
    compose(data, struct)
  end

  defp handle_response({:error, reason}, _struct) do
    {:error, reason}
  end
end
