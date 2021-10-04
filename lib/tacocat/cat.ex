defmodule Tacocat.Cat do
  @moduledoc """
  This produces a terminal animation of a rainbow cat using ANSI codes.

  You can use this in [`Cowrie`](https://hex.pm/packages/cowrie) as a
  spinner module.
  """

  # sleep betwen frames
  @frames_per_sec 12
  @sleep div(1000, @frames_per_sec)

  def start(_ \\ []) do
    frame(1)
  end

  defp frame(n) do
    IO.write(f(n))
    Process.sleep(@sleep)
    IO.write("\r#{IO.ANSI.cursor_up(4)}")

    case n do
      6 -> frame(1)
      _ -> frame(n + 1)
    end
  end

  defp c(0), do: IO.ANSI.reset()
  defp c(1), do: IO.ANSI.red()
  defp c(2), do: IO.ANSI.yellow()
  defp c(3), do: IO.ANSI.magenta()
  defp c(4), do: IO.ANSI.blue()

  defp f(1) do
    """
    #{c(1)}____━━____#{c(0)}┓#{c(1)}━#{c(0)}╭━━━━━╮
    #{c(2)}____━━____#{c(0)}┗┓|:::::: ^━━^
    #{c(3)}____━━____━#{c(0)}┗|:::::|｡◕‿‿◕｡
    #{c(4)}____━━____━━#{c(0)}╰O-O----O-O
    """
  end

  defp f(2) do
    """
    #{c(1)}___━━____#{c(0)}━┓#{c(1)}_#{c(0)}╭━━━━━╮
    #{c(2)}___━━____━#{c(0)}┗┓|:::::: ^━━^
    #{c(3)}___━━____━━#{c(0)}┗|:::::|｡◕‿‿◕｡
    #{c(4)}___━━____━━_#{c(0)}╰O-O----O-O
    """
  end

  defp f(3) do
    """
    #{c(1)}__━━____━━#{c(0)}┓#{c(1)}_#{c(0)}╭━━━━━╮
    #{c(2)}__━━____━━#{c(0)}┗┓|:::::: ^━━^
    #{c(3)}__━━____━━_#{c(0)}┗|:::::|｡◕‿‿◕｡
    #{c(4)}__━━____━━__#{c(0)}╰O-O----O-O
    """
  end

  defp f(4) do
    """
    #{c(1)}_━━____━━_#{c(0)}┓#{c(1)}_#{c(0)}╭━━━━━╮
    #{c(2)}_━━____━━_#{c(0)}┗┓|:::::: ^━━^
    #{c(3)}_━━____━━__#{c(0)}┗|:::::|｡◕‿‿◕｡
    #{c(4)}_━━____━━___#{c(0)}╰O-O----O-O
    """
  end

  defp f(5) do
    """
    #{c(1)}━━____━━__#{c(0)}┓#{c(1)}_#{c(0)}╭━━━━━╮
    #{c(2)}━━____━━__#{c(0)}┗┓|:::::: ^━━^
    #{c(3)}━━____━━___#{c(0)}┗|:::::|｡◕‿‿◕｡
    #{c(4)}━━____━━____#{c(0)}╰O-O----O-O
    """
  end

  defp f(6) do
    """
    #{c(1)}━____━━___#{c(0)}┓#{c(1)}━#{c(0)}╭━━━━━╮
    #{c(2)}━____━━___#{c(0)}┗┓|:::::: ^━━^
    #{c(3)}━____━━____#{c(0)}┗|:::::|｡◕‿‿◕｡
    #{c(4)}━____━━____━#{c(0)}╰O-O----O-O
    """
  end
end
