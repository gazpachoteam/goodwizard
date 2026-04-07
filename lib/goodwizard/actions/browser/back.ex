defmodule Goodwizard.Actions.Browser.Back do
  @moduledoc "Serialized wrapper around `Jido.Browser.Actions.Back`."

  use Jido.Action,
    name: "browser_back",
    description: "Navigate back in browser history",
    category: "Browser",
    tags: ["browser", "navigation", "history"],
    vsn: "1.0.0",
    schema: [
      timeout: [type: :integer, doc: "Timeout in milliseconds"]
    ]

  alias Goodwizard.Actions.Browser.Helpers

  @impl true
  def run(params, context), do: Helpers.run_serialized(Jido.Browser.Actions.Back, params, context)
end
