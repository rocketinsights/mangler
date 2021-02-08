defmodule Mangler.Validate do
  @ascii_printable_codepoint_range 32..127

  @type opts :: [allow: list(String.t())]

  @doc """
  Determines whether the given string is a valid unicode letter.
  It also returns true for any characters provided to the allowlist.
  """
  @spec unicode_letters_only?(String.t(), opts()) :: boolean
  def unicode_letters_only?(string, opts \\ []) do
    allowlist = Keyword.get(opts, :allow, [])

    for(grapheme <- String.graphemes(string), into: MapSet.new(), do: Enum.member?(allowlist, grapheme) || unicode_letter?(grapheme))
    |> MapSet.equal?(MapSet.new([true]))
    |> if(do: true, else: false)
  end

  @doc """
  Determines whether the given string is considered
  [ASCII printable](https://en.wikipedia.org/wiki/ASCII#Printable_characters).
  """
  @spec ascii_printable?(String.t()) :: boolean
  def ascii_printable?(string) do
    string
    |> String.to_charlist()
    |> Enum.all?(fn codepoint -> Enum.member?(@ascii_printable_codepoint_range, codepoint) end)
  end

  defp unicode_letter?(grapheme), do: String.match?(grapheme, ~r/^\p{L}$/u)
end
