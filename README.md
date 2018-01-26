# Publicist

Publicist is a module which, when in the test environment, remaps `defp` and
`defmacrop` to `def` and `defmacro`, respectively.

## Usage

```elixir
defmodule MyModule do
  use Publicist # use before any def statements
  defp my_priv_function do
    0
  end
end
```

Now you can test the private function:

```elixir
defmodule MyModule.Test do
 use ExUnit.Case

 test "my_priv_function returns 0" do
   assert my_priv_function() === 0
 end
end
```

## Installation

Publicist can be installed
by adding `publicist` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:publicist, "1.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/publicist](https://hexdocs.pm/publicist).

