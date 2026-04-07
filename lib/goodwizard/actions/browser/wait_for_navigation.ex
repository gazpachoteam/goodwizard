defmodule Goodwizard.Actions.Browser.WaitForNavigation do
  @moduledoc "Serialized wrapper around `Jido.Browser.Actions.WaitForNavigation`."

  use Jido.Action,
    name: "browser_wait_for_navigation",
    description: "Wait for page navigation to complete",
    category: "Browser",
    tags: ["browser", "wait", "navigation"],
    vsn: "1.0.0",
    schema: [
      url: [type: :string, doc: "URL pattern to match (substring match)"],
      timeout: [type: :integer, default: 30_000, doc: "Maximum wait time in milliseconds"]
    ]

  alias Goodwizard.Actions.Browser.Helpers

  @impl true
  def run(params, context),
    do: Helpers.run_serialized(Jido.Browser.Actions.WaitForNavigation, params, context)
end
