defmodule Mangler.ValidateTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  alias Mangler.Validate

  @ascii_printable_codepoint_range 32..127
  @ascii_extended_codepoint_range 128..255

  describe "ascii_compatible?/1" do
    property "returns true if input string is an ASCII printable character" do
      check all(
              list <- list_of(string(@ascii_printable_codepoint_range)),
              list != [],
              elem <- member_of(list)
            ) do
        assert Validate.ascii_printable?(elem)
      end
    end

    property "returns false if input string is an ASCII extended character" do
      check all(
              list <- list_of(string(@ascii_extended_codepoint_range, min_length: 1)),
              list != [],
              elem <- member_of(list)
            ) do
        refute Validate.ascii_printable?(elem)
      end
    end
  end

  describe "unicode_letters_only?" do
    test "returns true when string contains only valid unicode letters or those in the allowlist" do
      input_list = String.split(File.read!("test/data/validate/unicode_letters_only?/inputs.txt"), "\n")

      output_list =
        String.split(File.read!("test/data/validate/unicode_letters_only?/outputs.txt"), "\n", trim: true)
        |> Enum.map(&String.to_existing_atom(&1))

      io_list = List.zip([input_list, output_list])

      for {input, output} <- io_list do
        result = Validate.unicode_letters_only?(input, allow: ["-"])

        assert result == output, inspect_failure("Validate.unicode_letters_only?", input, output, result)
      end
    end
  end

  defp inspect_failure(method_name, input, output, result) do
    """
    #{method_name}(
      input = #{inspect(input)}
    )
    was expected to output #{output} but instead was #{result}
    """
  end
end
