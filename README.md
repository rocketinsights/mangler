# Mangler

A collection of utilities to validate and transform strings with diacritics, unicode and ascii.

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

## Usage

### Transform

```elixir
iex> Mangler.Transform.substitute_diacritics("Röçkêt Îñśíghtš")
"RocketInsights"
```

to preserve spaces or any other specific character use the `allow` opt
```elixir
iex> Mangler.Transform.substitute_diacritics("Röçkêt Îñśíghtš", allow: [" "])
"Rocket Insights"
```

### Validate unicode letters
```elixir
iex> Mangler.Validate.unicode_letters?("a")
true

iex> Mangler.Validate.unicode_letters?("🚀")
false

iex> Mangler.Validate.unicode_letters?("ö")
true
```

### Validate ascii letters

```elixir
iex> Mangler.Validate.ascii_printable?("a")
true

iex> Mangler.Validate.ascii_printable?("🚀")
false

iex> Mangler.Validate.ascii_printable?("ö")
false
```

## Authors

![Rocket Insights](https://www.rocketinsights.com/images/rocket_partofdept_logo.svg)

* [Chris Berube](https://github.com/crberube)
* [Jon Principe](https://github.com/jprincipe)

