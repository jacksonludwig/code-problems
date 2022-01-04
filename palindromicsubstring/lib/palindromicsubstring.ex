defmodule Palindromicsubstring do
  def is_palindrome?(s) when is_bitstring(s) do
    s == String.reverse(s)
  end

  @spec longest_palindrome(s :: String.t()) :: String.t()
  def longest_palindrome(s) do
    char_list = String.split(s, "", trim: true)
  end
end
