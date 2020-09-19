defmodule Tacocat.BonIver do
  @moduledoc """


  See also:
  - [Unicode Table](https://unicode-table.com/en/#0461)
  - [Miscellaneous Symbols](https://en.wikipedia.org/wiki/Miscellaneous_Symbols)
  """

  @doc """
  Modifies the input `text` into numeric symbology inspired by [Bon Iver](https://boniver.org/)
  on their [22, A Million](https://en.wikipedia.org/wiki/22,_A_Million) album.
  The transformation is somewhat random, so operations are not idempotent.

  ## Examples

      iex> Tacocat.bon_iver("Some way, baby, it's part of me, apart from me")
      "s҉mΣ ѡ∀(y), ʙaʙҰ, İT'$ pa⥤T ҉Ϝ mΣ, ߷part ∱r೦m ϻϵ"

      iex> Tacocat.bon_iver("Creeks")
      "[c]RΣΣkS"
  """
  def transform(text) when is_binary(text), do: text |> String.downcase() |> mod("")

  defp mod("", acc), do: acc
  defp mod("ae" <> tail, acc), do: mod(tail, acc <> Enum.random(["ǣ", "Ǣ", "Ӕ", "ӕ"]))
  defp mod("ee" <> tail, acc), do: mod(tail, acc <> Enum.random(["ΣΣ"]))
  defp mod("ie" <> tail, acc), do: mod(tail, acc <> Enum.random(["ѥ", "Ѥ"]))
  defp mod("ij" <> tail, acc), do: mod(tail, acc <> Enum.random(["ĳ"]))
  defp mod("oo" <> tail, acc), do: mod(tail, acc <> Enum.random(["∞"]))
  defp mod("ss" <> tail, acc), do: mod(tail, acc <> Enum.random(["∬"]))
  defp mod("th" <> tail, acc), do: mod(tail, acc <> Enum.random(["ҬҤ"]))
  defp mod("ts" <> tail, acc), do: mod(tail, acc <> Enum.random(["ʦ"]))
  defp mod("=" <> tail, acc), do: mod(tail, acc <> Enum.random(["=", "⚌", "☰"]))
  defp mod("a" <> tail, acc), do: mod(tail, acc <> Enum.random(["a", "A", "∀", "߷"]))
  defp mod("b" <> tail, acc), do: mod(tail, acc <> Enum.random(["b", "ʙ"]))
  defp mod("c" <> tail, acc), do: mod(tail, acc <> Enum.random(["C_", "Ͼ", "ȼ", "[c]"]))
  defp mod("d" <> tail, acc), do: mod(tail, acc <> Enum.random(["#d", "D⚃"]))
  defp mod("e" <> tail, acc), do: mod(tail, acc <> Enum.random(["Σ", "ϵ"]))
  defp mod("f" <> tail, acc), do: mod(tail, acc <> Enum.random(["∱", "Ϝ", "ʄ"]))
  defp mod("g" <> tail, acc), do: mod(tail, acc <> Enum.random(["₲", "g⚃"]))
  defp mod("h" <> tail, acc), do: mod(tail, acc <> Enum.random(["h", "ħ", "Ħ"]))
  defp mod("i" <> tail, acc), do: mod(tail, acc <> Enum.random(["i ⊠", "İ", "ї", "⚀"]))
  defp mod("j" <> tail, acc), do: mod(tail, acc <> Enum.random(["J", "Ɉ"]))
  defp mod("k" <> tail, acc), do: mod(tail, acc <> Enum.random(["k", "ĸ"]))
  defp mod("l" <> tail, acc), do: mod(tail, acc <> Enum.random(["L_", "˪L"]))
  defp mod("m" <> tail, acc), do: mod(tail, acc <> Enum.random(["m", "ϻ"]))
  defp mod("n" <> tail, acc), do: mod(tail, acc <> Enum.random(["N", "И"]))
  defp mod("o" <> tail, acc), do: mod(tail, acc <> Enum.random(["♢", "(circle)", "҉", "೦"]))
  defp mod("p" <> tail, acc), do: mod(tail, acc <> Enum.random(["p", "Ρ"]))
  defp mod("q" <> tail, acc), do: mod(tail, acc <> Enum.random(["Q", "Ϙ"]))
  defp mod("r" <> tail, acc), do: mod(tail, acc <> Enum.random(["⥤", "r", "R"]))
  defp mod("s" <> tail, acc), do: mod(tail, acc <> Enum.random(["s", "S", "$"]))
  defp mod("t" <> tail, acc), do: mod(tail, acc <> Enum.random(["T", "t", "ʇ"]))
  defp mod("u" <> tail, acc), do: mod(tail, acc <> Enum.random(["u", "ᑘ"]))
  defp mod("v" <> tail, acc), do: mod(tail, acc <> Enum.random(["vV", "˅V"]))
  defp mod("w" <> tail, acc), do: mod(tail, acc <> Enum.random(["W", "ѡ", "ʬ"]))
  defp mod("x" <> tail, acc), do: mod(tail, acc <> Enum.random(["x", "X⚅"]))
  defp mod("y" <> tail, acc), do: mod(tail, acc <> Enum.random(["(y)", "Ұ"]))
  defp mod("z" <> tail, acc), do: mod(tail, acc <> Enum.random(["z:", "☡", "ʐ"]))
  # Catch-all: Unmapped
  defp mod(<<head::binary-size(1)>> <> tail, acc), do: mod(tail, acc <> head)
end
