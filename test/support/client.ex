defmodule WordpressEx.Test.Client do
  @base_url Application.compile_env(:wordpress_ex, :base_url)

  def request(method, @base_url <> "/" <> path, _body, _headers, _options) do
    filename =
      "test/fixtures/responses/#{method}_#{path |> String.replace("/", "_")}_response.json"

    case File.read(filename) do
      {:ok, body} -> {:ok, %{body: body, status_code: 200}}
      {:error, _} -> IO.warn("Response file not found:" <> filename)
    end
  end
end
