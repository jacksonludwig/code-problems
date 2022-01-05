defmodule Townjudge do
  defp is_trusting_person?(i, trust_pair) do
    [_truster, trustee] = trust_pair
    i == trustee
  end

  defp pair_to_truster(trust_pair) do
    [truster, _trustee] = trust_pair
    truster
  end

  defp is_trusted_by_all?(i, trust_pairs, n) when i > 0 do
    Enum.to_list(1..n) -- [i] ==
      trust_pairs
      |> Enum.filter(&is_trusting_person?(i, &1))
      |> Enum.map(&pair_to_truster(&1))
      |> Enum.sort()
  end

  defp is_not_trusting_others?(i, trust_pairs) do
    result =
      trust_pairs
      |> Enum.map(&pair_to_truster(&1))
      |> Enum.member?(i)

    !result
  end

  @spec find_judge(n :: integer, trust :: [[integer]]) :: integer
  def find_judge(n, trust) do
    result =
      1..n
      |> Stream.filter(&is_trusted_by_all?(&1, trust, n))
      |> Enum.filter(&is_not_trusting_others?(&1, trust))

    case result do
      [] -> -1
      [hd | _] -> hd
    end
  end
end
