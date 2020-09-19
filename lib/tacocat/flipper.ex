defmodule Tacocat.Flipper do
  @moduledoc """
  This module houses the functions that deal with rotating and flipping text.

  Adapted from http://www.fileformat.info/convert/text/upside-down-map.htm
  """

  @map %{
    ?A => ?∀,
    ?a => ?ɐ,
    ?b => ?q,
    ?B => ?𐐒,
    ?c => ?ɔ,
    ?C => ?Ↄ,
    ?D => ?◖,
    ?d => ?p,
    ?E => ?Ǝ,
    ?e => ?ǝ,
    ?F => ?Ⅎ,
    ?f => ?ɟ,
    ?G => ?⅁,
    ?g => ?ƃ,
    # H => H
    ?h => ?ɥ,
    # I => I
    ?i => ?ı,
    ?J => ?ſ,
    ?j => ?ɾ,
    ?K => ?⋊,
    ?k => ?ʞ,
    ?L => ?⅂,
    ?l => ?ʃ,
    ?M => ?W,
    ?m => ?ɯ,
    ?N => ?ᴎ,
    ?n => ?u,
    # O => O
    # o => o
    ?P => ?Ԁ,
    ?p => ?d,
    ?Q => ?Ό,
    ?q => ?b,
    ?R => ?ᴚ,
    ?r => ?ɹ,
    # S => S
    ?T => ?⊥,
    ?t => ?ʇ,
    ?U => ?∩,
    ?u => ?n,
    ?V => ?ᴧ,
    ?v => ?ʌ,
    ?W => ?M,
    ?w => ?ʍ,
    # X => x
    ?Y => ?⅄,
    ?y => ?ʎ,
    # Z => Z
    ?. => ?˙,
    ?; => ?؛,
    ?" => ?„,
    ?' => ?,,
    ?! => ?¡,
    ?? => ?¿,
    ?∴ => ?∵,
    ?& => ?⅋,
    ?_ => ?‾,
    ?⁅ => ?⁆,
    ?< => ?>,
    ?4 => ?ᔭ,
    ?3 => ?Ɛ,
    ?6 => ?9,
    ?7 => ?Ɫ,
    ?‿ => ?⁀,
    ?( => ?),
    ?[ => ?],
    ?{ => ?}
  }

  @doc """
  Backflip is usually what you want: it reverses the input string and then flips it, which for some reason makes the
  result more recognizable.

  ## Examples

      iex> Tacocat.backflip("Who are these people?")
      "¿ǝʃdoǝd ǝsǝɥʇ ǝɹɐ oɥM"

  Adapted from http://www.fileformat.info/convert/text/upside-down-map.htm
  """
  def backflip(text) when is_binary(text) do
    text
    |> String.reverse()
    |> flip()
  end

  @doc """
  This function turns the given text "upside down" by replacing characters with some Unicode equivalent that looks
  similar to the input rotated 180 degrees. If a character doesn't have its flip mapped, it is passed through unchanged.
  Often, you may want `backflip/2` instead.

  ## Examples

      iex> Tacocat.Flipper.flip("Who are these people?")
      "Mɥo ɐɹǝ ʇɥǝsǝ dǝodʃǝ¿"

  Adapted from http://www.fileformat.info/convert/text/upside-down-map.htm
  """
  def flip(text) when is_binary(text) do
    text
    |> to_charlist()
    |> do_flip([])
    |> Enum.reverse()
    |> List.to_string()
  end

  defp do_flip([], acc), do: acc

  defp do_flip([char | tail], acc) do
    do_flip(tail, [Map.get(@map, char, char) | acc])
  end
end
