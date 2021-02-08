# Mangler

A collection of utilities to validate and transform strings.

Substitute [diacritics](https://en.wikipedia.org/wiki/Diacritic) in the given string with their ASCII equivalents. This function works by performing [NFD normalization](https://en.wikipedia.org/wiki/Unicode_equivalence#Normal_forms) on the [graphemes](https://en.wikipedia.org/wiki/Grapheme) in the string. It then removes any non-words from the string. Due to this, an allowlist must be provided to keep any non-word characters intact.

Also provides utility functions to validate if a string contains ASCII or Unicode characters 

## Installation

```elixir
def deps do
  [
    {:mangler, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/mangler](https://hexdocs.pm/mangler).
