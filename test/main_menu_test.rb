require_relative 'test_helper.rb'
require './lib/main_menu.rb'
require 'colorize'

class MenuTest < Minitest::Test

  def setup
    @menu = Menu.new
  end

  def test_if_it_exists

    assert_instance_of Menu, @menu
  end

  def test_stores_user_decision
    Menu.any_instance.stubs(:gets).returns("p")
    @menu.start

    assert_equal "p", @menu.user_decision
  end


end
