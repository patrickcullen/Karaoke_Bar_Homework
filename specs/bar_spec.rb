require("minitest/autorun")
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../bar.rb")

class BarTest < MiniTest::Test

  def setup
    @bar_name = "The Broken Finger"
    @bar_cash = 500
    @bar_drinks = [["Wine", 10],["Gin", 12],["Beer", 5]]
    @bar_tabs = {"Andy Goram" => 20}
    @bar = Bar.new(@bar_name, @bar_cash, @bar_drinks, @bar_tabs)
    @guest1 = Guest.new("Stuart Kennedy", 40, "Oops, I Did It Again")
    @guest2 = Guest.new("Alan Rough", 65, "Love Don't Live Here Anymore")
    @guest3 = Guest.new("Andy Goram", 100, "Mr Big Stuff")
    @guest4 = Guest.new("Jim Leighton", 5, "Chicken Grease")
    @guest5 = Guest.new("Craig Gordon", 60, "Chicken Grease")
    @room1 = Room.new(1, 10, 4, [@guest1.guest_name, @guest2.guest_name],["Chicken Grease", "Start Me Up", "She Loves You"])
    @room2 = Room.new(2, 15, 6, [], [])
    @room3 = Room.new(3, 1, 2, ["Bill", "Martin"], [])
  end

  def test_bar_name()
    assert_equal("The Broken Finger", @bar_name)
  end

  def test_bar_cash()
    assert_equal(500, @bar_cash)
  end

  def test_bar_drinks()
    assert_equal("Gin", @bar_drinks[1][0])
  end


end
