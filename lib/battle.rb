class Battle
  attr :player, :enemy

  def initialize player, enemy
    @player = player
    @enemy = enemy
  end

  def start_battle
    while @player.current_health > 0 || @enemy.current_health > 0 do
    if @player.turn == true
      @player.attack(@enemy)
    else
      @enemy.attack(@player)
    end
    next_turn(@player)
    end
  end

  def next_turn player
    @player.turn ^= true #that toggles the turn every time you run it
  end
end
