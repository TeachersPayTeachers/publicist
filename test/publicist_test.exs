defmodule PublicistTest.Foo do
  use Publicist
  defp bar() do
    0
  end
end

defmodule PublicistTest do
  use ExUnit.Case
  doctest Publicist

  test "PublicistTest.Foo.bar is accessible" do
    assert PublicistTest.Foo.bar() === 0
  end
end
