class Player

  attr_reader :name, :level
  attr_accessor :health, :power, :xp

  def initialize name
    @name = name
    @health = 10
    @power = 3
    @level = 1
    @xp = 0
  end

  def attack target
    if crit_chance == 15
      target.health -= (@power * 2)
    else
      target.health -= @power
    end
  end

  def crit_chance
    random_num = rand(16)
    random_num
  end

  def heal
    @health += 2
  end

  def level_up
    if @xp == 5
      @level += 1
      @xp = 0
    end
  end
end
