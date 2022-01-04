defmodule Validparens do
  def check_each([], [], _), do: true
  def check_each([], [_h | _t], _), do: false

  def check_each([h | t], stack, paren_map) do
    [current_paren | parens] = [h | t]

    if Map.keys(paren_map) |> Enum.member?(current_paren) do
      if not Enum.empty?(stack) and hd(stack) == paren_map[current_paren] do
        check_each(parens, tl(stack), paren_map)
      else
        false
      end
    else
      check_each(parens, [current_paren | stack], paren_map)
    end
  end

  @spec is_valid(s :: String.t()) :: boolean
  def is_valid(s) do
    paren_map = %{")" => "(", "}" => "{", "]" => "["}

    s |> String.split("", trim: true) |> check_each([], paren_map)
  end
end
