defmodule Tacocat do
  @moduledoc """
  This module provides a simple API: its functions are the ones users should use.
  """
  alias Tacocat.Flipper
  alias Tacocat.BonIver

  defdelegate bon_iver(text), to: BonIver, as: :transform

  defdelegate flip(text), to: Flipper, as: :flip

  defdelegate backflip(text), to: Flipper, as: :backflip
end
