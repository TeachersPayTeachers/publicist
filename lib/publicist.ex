defmodule Publicist do
  @moduledoc """
  Publicist is a module that conditionally makes private functions and macros
  public.

  To use, `use Publicist`. If `Mix.env` is `:test` during compilation, all
  private definitions of functions and macros will be replaced with public
  ones, allowing them to be tested.
  """

  defmacro __using__(opts \\ []) do
    envs = Keyword.get(opts, :only, [:test])

    if Enum.member?(envs, Mix.env()) do
      quote do
        import Kernel, except: [defp: 2, defp: 1, defmacrop: 2, defmacrop: 1]
        import Publicist, only: [defp: 2, defp: 1, defmacrop: 2, defmacrop: 1]
      end
    end
  end

  @doc "Alias for `Kernel.def/2` Makes this magic happen."
  defmacro defp(whatever, expr \\ nil) do
    quote do
      Kernel.def(unquote(whatever), unquote(expr))
    end
  end

  @doc "Alias for `Kernel.defmacro/2` Makes this magic happen."
  defmacro defmacrop(whatever, expr \\ nil) do
    quote do
      Kernel.defmacro(unquote(whatever), unquote(expr))
    end
  end
end
