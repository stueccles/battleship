require "minitest/autorun"
require "battleship/board"
require "basic_player"

class BasicPlayerTest < MiniTest::Unit::TestCase
  include Battleship
  
  def setup
      @player = BasicPlayer.new
      @basic_state = [
                      [:miss, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown],
                      [:unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown],
                      [:unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown],
                      [:unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown],
                      [:unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown],
                      [:unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown],
                      [:unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown],
                      [:unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown],
                      [:unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown],
                      [:unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown, :unknown],
                    ]
                    
      @one_remaining_state = [
                      [:miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss],
                      [:miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss],
                      [:miss, :miss, :miss, :hit, :miss, :miss, :miss, :miss, :miss, :miss],
                      [:miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss],
                      [:miss, :unknown, :miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss],
                      [:miss, :miss, :miss, :miss, :miss, :miss, :miss, :hit, :miss, :miss],
                      [:miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss],
                      [:miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss],
                      [:miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss],
                      [:miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss, :miss],
                    ]
  end
  
  def test_should_create_valid_game_board
    board = Board.new(10, [5, 4, 3, 3, 2], @player.new_game)
    assert board.valid?
  end
  
  def test_should_take_a_shot
    @player.new_game
    shot = @player.take_turn(@basic_state,[5, 4, 3, 3, 2])
    assert !shot.nil?
    assert !shot[0].nil?
    assert !shot[1].nil?
  end
  
  def test_should_take_a_valid_shot
    @player.new_game
    shot = @player.take_turn(@basic_state,[5, 4, 3, 3, 2])
    assert (shot[0] >= 0)
    assert (shot[0] < 10)
    assert (shot[1] >= 0)
    assert (shot[1] < 10)
  end
  
  def test_should_not_repeat_shots
    @player.new_game
    shot = @player.take_turn(@one_remaining_state,[5, 4, 3, 3, 2])
    assert (shot == [1,4]), "used an already missed state with #{shot.inspect}"
  end
  
end    