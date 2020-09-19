defmodule Tacocat do
  @moduledoc """
  This module provides an interface for text manipulation functions.
  For the ease of organization and encapsulation, the functions are delegated to stand-alone modules.
  """
  alias Tacocat.Flipper
  alias Tacocat.BonIver

  @doc since: "0.2.0"
  defdelegate bon_iver(text), to: BonIver, as: :bon_iver

  defdelegate flip(text), to: Flipper, as: :flip

  defdelegate backflip(text), to: Flipper, as: :backflip
end
