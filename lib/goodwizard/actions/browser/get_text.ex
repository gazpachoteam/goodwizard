defmodule Goodwizard.Actions.Browser.GetText do
  @moduledoc "Serialized wrapper around `Jido.Browser.Actions.GetText`."

  use Jido.Action,
    name: "browser_get_text",
    description: "Get text content of an element",
    category: "Browser",
    tags: ["browser", "text", "content"],
    vsn: "1.0.0",
    schema: [
      selector: [type: :string, required: true, doc: "CSS selector for the element"],
      all: [type: :boolean, default: false, doc: "Get text from all matching elements"]
    ]

  alias Goodwizard.Actions.Browser.Helpers

  @impl true
  def run(params, context),
    do: Helpers.run_serialized(Jido.Browser.Actions.GetText, params, context)
end
