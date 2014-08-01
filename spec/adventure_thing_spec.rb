require 'rspec'
require 'player'
require 'enemy'


describe 'Player' do
  it 'creates an instance of player' do
    test_player = Player.new("Steve")
    expect(test_player).to be_an_instance_of Player
  end

  it 'lets you read the player name' do
    test_player = Player.new("Steve")
    expect(test_player.name).to eq "Steve"
  end

  it 'attacks a target enemy' do
    test_player = Player.new("Steve")
    test_enemy = Enemy.new("Joe")
    test_player.attack(test_enemy)
    expect(test_enemy.health).to eq (7 || 4)
  end

  it 'increases player level' do
    test_player = Player.new("Steve")
    test_player.xp = 5
    test_player.level_up
    expect(test_player.level).to eq 2
  end
end

describe 'Enemy' do
  it 'creates an instance of enemy' do
    test_enemy = Enemy.new("Joe")
    expect(test_enemy).to be_an_instance_of Enemy
  end

  it 'lets you read the enemy name' do
    test_enemy = Enemy.new("Joe")
    expect(test_enemy.name).to eq "Joe"
  end

  it 'attacks the player' do
    test_player = Player.new("Steve")
    test_enemy = Enemy.new("Joe")
    test_enemy.attack(test_player)
    expect(test_player.health).to eq 7
  end

  it 'gives xp to the player' do
    test_player = Player.new("Steve")
    test_enemy = Enemy.new("Joe")
    test_enemy.health = 0
    test_enemy.give_xp(test_player)
    expect(test_player.xp).to eq 1
  end
end
