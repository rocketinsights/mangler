defmodule Mangler do
  @moduledoc ~S"""
  A collection of utilities to validate and transform strings with diacritics, unicode and ascii.

    * `Mangler.Transform` - Helper to substitute diacritics with their ASCII equivalents

    * `Mangler.Validate` - functions to validate the character sets of input string

  ## Usage

  ### Transform

      iex> Mangler.Transform.substitute_diacritics("Röçkêt Îñśíghtš")
      "RocketInsights"

      # to preserve spaces or any other specific character use the `allow` opt
      iex> Mangler.Transform.substitute_diacritics("Röçkêt Îñśíghtš", allow: [" "])
      "Rocket Insights"

  ### Validate unicode letters

      iex> Mangler.Validate.unicode_letters?("a")
      true

      iex> Mangler.Validate.unicode_letters?("🚀")
      false

      iex> Mangler.Validate.unicode_letters?("ö")
      true

  ### Validate ascii letters

      iex> Mangler.Validate.ascii_printable?("a")
      true

      iex> Mangler.Validate.ascii_printable?("🚀")
      false

      iex> Mangler.Validate.ascii_printable?("ö")
      false
  """
end
