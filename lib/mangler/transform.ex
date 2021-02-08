defmodule Mangler.Transform do
  @type opts :: [allow: list(String.t())]

  @doc """
  Substitute [diacritics](https://en.wikipedia.org/wiki/Diacritic) in
  the given string with their ASCII equivalents. This function works by
  performing [NFD normalization](https://en.wikipedia.org/wiki/Unicode_equivalence#Normal_forms)
  on the [graphemes](https://en.wikipedia.org/wiki/Grapheme) in the string. It then
  removes any non-words from the string. Due to this, an allowlist must be provided to
  keep any non-word characters intact.
  """
  @spec substitute_diacritics(String.t(), opts()) :: String.t()
  def substitute_diacritics(string, opts \\ []) do
    allowlist = Keyword.get(opts, :allow, [])

    for grapheme <- String.graphemes(string), into: "" do
      grapheme
      |> String.normalize(:nfd)
      |> without_non_words(allowlist)
    end
  end

  defp without_non_words(grapheme, allowlist) do
    if Enum.member?(allowlist, grapheme) do
      grapheme
    else
      String.replace(grapheme, ~r/\W/u, "")
    end
  end
end
