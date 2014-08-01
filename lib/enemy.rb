class Enemy < Fighter

  attr_reader :xp_value, :name_array

  def initialize
    super(random_name)
    @xp_value = 1
  end

  def give_xp target
    if @current_health == 0
      target.xp += @xp_value
    end
  end

  def random_name
    @name_array = ["Cleaverrot", "Foulshred", "Sickarse", "Demonstomach", "Murdergouge"]
    get_name = @name_array.at(rand(@name_array.length))
    get_name
  end



end
