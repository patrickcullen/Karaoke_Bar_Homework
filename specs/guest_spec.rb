require("minitest/autorun")
require_relative("../guest.rb")
require_relative("../room.rb")
require_relative("../bar.rb")

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Stuart Kennedy", 40, "Oops, I Did It Again")
    @guest2 = Guest.new("Alan Rough", 65, "Love Don't Live Here Anymore")
    @guest3 = Guest.new("Andy Goram", 100, "Mr Big Stuff")
    @guest4 = Guest.new("Jim Leighton", 5, "Chicken Grease")
    @guest5 = Guest.new("Craig Gordon", 60, "Moon River")
    @room1 = Room.new(1, 10, 4, [@guest1, @guest2], [])
    @room2 = Room.new(2, 15, 6, [], [])
  end

  def test_guest_name
    assert_equal("Craig Gordon", @guest5.guest_name())
  end

  def test_guest_money
    assert_equal(100, @guest3.guest_cash())
  end

  # Does the room include the guest's favourite song?

  def test_guest_fav_song
    assert_equal("Oops, I Did It Again", @guest1.guest_fav_song())
  end

  # The guest pays for room or drink

  def test_guest_pays()
    @guest3.guest_pays(@room1.room_fee_per_guest)
    assert_equal(90, @guest3.guest_cash)
  end


end
