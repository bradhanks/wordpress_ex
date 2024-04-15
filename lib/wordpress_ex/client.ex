defmodule WordpressEx.Client do
  @moduledoc false

  @doc """
  GET endpoint that returns a parsed response
  """
  defp base_url, do: Application.get_env(:wordpress_ex, :base_url, "")
  defp http_client, do: Application.get_env(:wordpress_ex, :http_client, HTTPoison)

  def get(path, params) do
    response(:get, path, "", [], params: params)
    |> parse
  end

  defp parse({:ok, %{status_code: 200} = response}) do
    parse_json(response.body)
  end

  defp parse({:ok, response}) do
    {:error, "Unexpected status code: #{response.status_code}"}
  end

  defp parse({:error, _reason} = error) do
    error
  end

  defp parse_json(json) do
    case Jason.decode(json) do
      {:ok, data} -> data
      error -> error
    end
  end

  defp response(method, path, body, headers, options) do
    http_client().request(method, base_url() <> path, body, headers, options)
  end
end
