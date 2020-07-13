defmodule Tacocat do
  @moduledoc """
  This module provides a simple API: its functions are the ones users should use.
  """
  alias Tacocat.Flipper

  defdelegate flip(text), to: Flipper, as: :flip

  defdelegate backflip(text), to: Flipper, as: :backflip
end
