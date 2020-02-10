require_relative 'test_helper.rb'
require './lib/setup.rb'

class SetupTest < Minitest::Test
  
  def test_it_exists

  assert_instance_of Setup, Setup.new
  end

end
