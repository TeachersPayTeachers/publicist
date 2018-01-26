defmodule PublicistTest.Foo do
  use Publicist
  defp bar() do
    0
  end

  defmacrop bar_macro, do: :bar
end

defmodule PublicistTest do
  use ExUnit.Case
  doctest Publicist

  test "PublicistTest.Foo.bar function is accessible" do
    assert PublicistTest.Foo.bar() === 0
  end

  test "PublicistTest.Foo.bar_macro macro is accessible" do
    require PublicistTest.Foo
    assert PublicistTest.Foo.bar_macro() === :bar
  end
end
