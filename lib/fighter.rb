class Fighter

  attr_reader :name, :level, :maximum_health
  attr_accessor :current_health, :power

  def initialize name
    @name = name
    @current_health = 10
    @maximum_health = 10
    @power = 3
    @level = 1
  end

  def attack target
    crit_chance
    if crit_chance == 15
      num = 15
      target.current_health -= (@power * 2)
    else
      target.current_health -= @power
    end
  end

  def crit_chance
    random_num = rand(16)
    random_num
  end

  def heal
    if @current_health == @maximum_health
      "You're already at full health"
    elsif (@current_health == (@maximum_health - 1))
      @current_health += 1
    else
      @current_health += 2
    end
  end

end
