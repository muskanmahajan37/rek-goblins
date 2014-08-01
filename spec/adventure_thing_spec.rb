require 'rspec'
require 'battle'
require 'fighter'
require 'player'
require 'enemy'


describe 'Fighter' do
  it 'creates a new fighter' do
    test_fighter = Fighter.new("Jim")
    expect(test_fighter).to be_an_instance_of Fighter
  end

  it 'shows the name of the fighter' do
    test_fighter = Fighter.new("Jim")
    expect(test_fighter.name).to eq "Jim"
  end

  it 'shows the current health of the fighter' do
    test_fighter = Fighter.new("Jim")
    expect(test_fighter.current_health).to eq 10
  end

  it 'shows the maximum health of the fighter' do
    test_fighter = Fighter.new("Jim")
    expect(test_fighter.maximum_health).to eq 10
  end

  it 'shows the power of the fighter' do
    test_fighter = Fighter.new("Jim")
    expect(test_fighter.power).to eq 3
  end

  it 'shows the level of the fighter' do
    test_fighter = Fighter.new("Jim")
    expect(test_fighter.level).to eq 1
  end

  it 'attacks a target fighter' do
    test_fighter = Fighter.new("Jim")
    target_fighter = Fighter.new("Joe")
    allow(test_fighter).to receive(:rand){0}
    test_fighter.attack(target_fighter)
    expect(target_fighter.current_health).to eq 7
  end

  it 'attacks a target fighter with more damage' do
    test_fighter = Fighter.new("Jim")
    target_fighter = Fighter.new("Joe")
    allow(test_fighter).to receive(:rand){15}
    test_fighter.attack(target_fighter)
    expect(target_fighter.current_health).to eq 4
  end

  it 'heals self' do
    test_fighter = Fighter.new("Jim")
    test_fighter.current_health = 6
    test_fighter.heal
    expect(test_fighter.current_health).to eq 8
  end

  it 'only heals self if current health is less than maximum health' do
    test_fighter = Fighter.new("Jim")
    expect(test_fighter.heal).to eq "You're already at full health"
  end

  it 'heals 1 if current health is one less than maximum health' do
    test_fighter = Fighter.new("Jim")
    test_fighter.current_health = 9
    test_fighter.heal
    expect(test_fighter.current_health).to eq 10
  end
end

describe 'Battle' do
  it 'creates a new battle' do
    test_player = Player.new("Jim")
    test_enemy = Enemy.new()
    test_battle = Battle.new(test_player, test_enemy)
    expect(test_battle).to be_an_instance_of Battle
  end

  it 'shows the player and enemy' do
    test_player = Player.new("Jim")
    test_enemy = Enemy.new()
    test_battle = Battle.new(test_player, test_enemy)
    expect(test_battle.player).to eq test_player
    expect(test_battle.enemy).to eq test_enemy
  end

end

describe 'Player' do
  it 'creates a new player' do
    test_player = Player.new("Bob")
    expect(test_player).to be_an_instance_of Player
  end

  it 'should be an instance of fighter' do
    test_player = Player.new("Bob")
    expect(test_player).to be_a_kind_of Fighter
  end

  it 'increases in level when enough experience points are gained' do
    test_player = Player.new("Bob")
    test_player.xp = 5
    test_player.level_up
    expect(test_player.level).to eq 2
  end
end

describe 'Enemy' do
  it 'creates a new enemy' do
    test_enemy = Enemy.new()
    expect(test_enemy).to be_an_instance_of Enemy
  end

  it 'should be an instance of fighter' do
    test_enemy = Enemy.new()
    expect(test_enemy).to be_a_kind_of Fighter
  end

  it 'should get a random name' do
    test_enemy = Enemy.new()
    expect(test_enemy.name_array.at(0)).to eq "Cleaverrot"
  end

  it 'gives experience points to the player when slain' do
    test_player = Player.new("Bob")
    test_enemy = Enemy.new()
    test_enemy.current_health = 0
    test_enemy.give_xp(test_player)
    expect(test_player.xp).to eq 1
  end
end
