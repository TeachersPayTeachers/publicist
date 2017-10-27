defmodule Publicist do
  @moduledoc """
  Publicist is a module that conditionally makes functions public.

  To use, `use Publicist`. If the `Mix.env` variable is `:test`, all `defp`
  calls will be replaced with `def` calls, allowing private methods to be
  tested.
  """

  defmacro __using__(opts \\ []) do
    envs = Keyword.get(opts, :only, [:test])
    if Enum.member?(envs, Mix.env) do
      quote do
        import Kernel, except: [defp: 2, defp: 1]
        import Publicist, only: [defp: 2, defp: 1]
      end
    end
  end

  @doc "Alias for `Kernel.def/2` Makes this magic happen."
  defmacro defp(whatever, expr \\ nil) do
    quote do
      Kernel.def(unquote(whatever), unquote(expr))
    end
  end
end
