defmodule Hangman do

  alias Hangman.Impl.Game

  @type   state :: :initializing | :won | :lost | :good_guess | :bad_guess | :already_used
  @opaque game  :: Game.t
  @type   tally :: %{
    turns_left: integer,
    game_state: state,
    letters: list(String.t),
    used: list(String.t),
  }

  @spec new_game() ::  game
  defdelegate new_game, to: Game

  @spec make_move(game, String.t) :: { game, tally }
  defdelegate make_move(game, guess), to: Game

  @spec tally(game) :: tally()
  defdelegate tally(game), to: Game
end
