+++
description = "Hello World in Elixir"
filename = "hello.ex"
+++

defmodule Hello do
  @moduledoc """
  A simple Hello World module demonstrating Elixir basics.
  """

  def greet(name \\ "World") do
    IO.puts("Hello, #{name}!")
  end
end

# Run it:
Hello.greet()
Hello.greet("Pedro")
