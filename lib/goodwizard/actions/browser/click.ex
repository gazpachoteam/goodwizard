defmodule Goodwizard.Actions.Browser.Click do
  @moduledoc "Serialized wrapper around `Jido.Browser.Actions.Click`."

  use Jido.Action,
    name: "browser_click",
    description: "Click an element in the browser",
    category: "Browser",
    tags: ["browser", "click", "interaction"],
    vsn: "1.0.0",
    schema: [
      selector: [type: :string, required: true, doc: "CSS selector for the element to click"],
      text: [type: :string, doc: "Optional text content to match within the selector"],
      timeout: [type: :integer, doc: "Timeout in milliseconds"]
    ]

  alias Goodwizard.Actions.Browser.Helpers

  @impl true
  def run(params, context), do: Helpers.run_serialized(Jido.Browser.Actions.Click, params, context)
end
