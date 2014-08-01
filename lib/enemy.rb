class Enemy
  attr_reader :name, :level
  attr_accessor :health, :power

  def initialize name
    @name = name
    @health = 10
    @power = 3
    @level = 1
    @xp_value = 1
  end

  def attack target
    target.health -= @power
  end

  def crit_chance
    if rand(16) == 15

    end
  end

  def heal
    @health += 2
  end

  def give_xp target
    if @health == 0
      target.xp += @xp_value
    end
  end
end
