require_relative 'test_helper.rb'
require './lib/main_menu.rb'

class MenuTest < Minitest::Test


  def test_if_it_exists

    assert_instance_of Menu, Menu.new
  end

  def test_stores_user_decision

    assert_equal "p", Menu.new.user_decision
  end


end
