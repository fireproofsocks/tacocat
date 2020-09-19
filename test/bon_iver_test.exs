defmodule Tacocat.BonIverTest do
  alias Tacocat.BonIver
  use ExUnit.Case

  describe "bon_iver/1" do
    test "things change some" do
      start = "Hello"
      transformed = BonIver.bon_iver(start)
      refute start == transformed
    end
  end
end
