defmodule Tacocat.BonIverTest do
  alias Tacocat.BonIver
  use ExUnit.Case

  describe "transform/1" do
    test "things change some" do
      start = "Hello"
      transformed = BonIver.transform(start)
      assert "H" <> _rest = transformed
      refute start == transformed
    end
  end
end
