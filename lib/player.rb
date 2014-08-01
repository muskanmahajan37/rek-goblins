class Player < Fighter

  attr_accessor :xp, :turn

  def initialize name
    super(name)
    @xp = 0
    @turn = true
  end

  def level_up
    if @xp == 5
      @level += 1
      @xp = 0
    end
  end

end
