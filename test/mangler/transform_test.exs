defmodule Mangler.TransformTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  alias Mangler.Transform

  describe "?" do
    test "returns string substituting diacritics for ASCII values" do
      input_list = String.split(File.read!("test/data/transform/substitute_diacritics/inputs.txt"), "\n")

      output_list = String.split(File.read!("test/data/transform/substitute_diacritics/outputs.txt"), "\n", trim: true)

      io_list = List.zip([input_list, output_list])

      for {input, output} <- io_list do
        result = Transform.substitute_diacritics(input, allow: ["-"])

        assert result == output, inspect_failure("Transform.substitute_diacritics", input, output, result)
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
