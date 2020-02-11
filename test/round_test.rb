require_relative 'test_helper.rb'
require './lib/ship.rb'
require './lib/cell.rb'
require './lib/round.rb'

class RoundTest < Minitest::Test

    def setup
      @round = Round.new

    end

    def test_if_it_exists
      assert_instance_of Round, @round

    end
end
