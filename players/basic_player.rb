class BasicPlayer
  def name
    "Basic Player"
  end

  def new_game
    @last_shot = nil
    @last_state = nil
    @last_ships_remaining = nil
    
    placement = [
      [0, 0, 5, :across],
      [0, 1, 4, :across],
      [0, 2, 3, :across],
      [0, 3, 3, :across],
      [0, 4, 2, :across]
    ]

  end

  def take_turn(state, ships_remaining)
    
    shot = hunt_for_ships(state, ships_remaining)
    @last_shot = shot
    @last_state = state
    @last_ships_remaining = ships_remaining
    return shot
  end
  
  private
    def hunt_for_ships(state, ships_remaining)
      possible_shots = []
      state.each_with_index do |row, y|
         row.each_with_index do |cell, x|
           possible_shots << [x,y] if cell == :unknown
         end
      end
           
      return possible_shots.shuffle[0]
    end
    
    def target_ship
      
    end
end
