+++
title = "Helmsman, an Elixir package for building agents"
date = 2026-03-15T00:00:00+00:00
slug = "helmsman"
description = "I built Helmsman, an Elixir framework for building LLM-based agents, inspired by Pi's SDK mode and aligned with Elixir patterns and conventions."

[taxonomies]
tags = ["Elixir", "AI", "Open Source", "Agents"]
+++
I was tinkering earlier this week with the [Pi coding agent](https://shittycodingagent.ai/), which popularized through [OpenClaw](https://openclaw.ai/) and its extensibility capabilities, and couldn't resist looking at what the options in the Elixir ecosystem are. Not options in terms of a coding executable, but options in terms of a framework that one can use to build agents. Similar to Pi's SDK mode, which is designed specifically for that if Node/Bun/Deno are your runtimes. The closest I could find was [Jido](https://hexdocs.pm/jido/readme.html), which provides the primitives to model agentic workflows, an idea that exists before LLMs popularized it, but I felt its building blocks were too distant from the concepts LLM-based agentic workflows work with. They didn't click with me.

I like doing some hacking on Sunday afternoons, so I thought it'd be a good exercise to build a framework for Elixir learning from ideas from Pi. The result of this work is [Helmsman](https://github.com/pepicrft/helmsman), an Elixir framework for building agents. I put a strong focus on aligning the APIs with Elixir patterns and conventions, and the concepts with LLM-based agentic workflows. Here's an example of how to use it:

```elixir
defmodule MyApp.CodingAgent do
  use Helmsman

  @impl true
  def tools do
    Helmsman.Tools.coding_tools()
  end
end

{:ok, agent} = MyApp.CodingAgent.start_link(
  api_key: System.get_env("ANTHROPIC_API_KEY"),
  system_prompt: """
  You are an expert software engineer.
  Write clean, well-documented code.
  Always run tests after making changes.
  """
)

Helmsman.stream(agent, "Add documentation to the counter module")
|> Stream.each(fn
  {:text, chunk} -> IO.write(chunk)
  {:tool_call, name, _id, _args} -> IO.puts("\n📦 Using tool: #{name}")
  {:tool_result, _id, result} -> IO.puts("   Result: #{inspect(result)}")
  :done -> IO.puts("\n✅ Done!")
  _ -> :ok
end)
|> Stream.run()
```

We include a set of tools that you can override or extend to customize the behavior of your agent. For example, this is how you define a custom tool:

```elixir
defmodule MyApp.Tools.Weather do
  use Helmsman.Tool

  @impl true
  def name, do: "get_weather"

  @impl true
  def description, do: "Gets the current weather for a location"

  @impl true
  def parameters do
    %{
      type: "object",
      properties: %{
        location: %{type: "string", description: "City name"}
      },
      required: ["location"]
    }
  end

  @impl true
  def call(%{"location" => location}, _context) do
    case WeatherAPI.get(location) do
      {:ok, data} -> {:ok, "Temperature: #{data.temp}°F"}
      {:error, reason} -> {:error, reason}
    end
  end
end
```

And building on Erlang's awesomeness, Helmsman comes with telemetry events that you can use to track agent behavior:

```
:telemetry.attach_many(
  "my-handler",
  [
    [:helmsman, :agent, :start],
    [:helmsman, :agent, :stop],
    [:helmsman, :tool_call, :start],
    [:helmsman, :tool_call, :stop]
  ],
  fn event, measurements, metadata, _config ->
    Logger.info("#{inspect(event)}: #{inspect(measurements)}")
  end,
  nil
)
```

If you want to tinker with it, you can use the [livebook](https://github.com/pepicrft/helmsman/blob/main/livebooks/local_playground.livemd) included in the repository. Next weekend, I plan to start leveraging this in another experiment of mine where I'm exploring what version control systems for the modern patterns that are emerging might look like. I'm calling it Micelio, and you'll likely hear more from me talking about it.
