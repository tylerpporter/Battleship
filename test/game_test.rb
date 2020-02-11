require_relative 'test_helper.rb'
require './lib/game.rb'


class GameTest < Minitest::Test


  def test_it_exists

    assert_instance_of Game, Game.new
  end

end
