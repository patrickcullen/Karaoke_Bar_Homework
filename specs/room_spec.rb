require("minitest/autorun")
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../bar.rb")

class RoomTest < MiniTest::Test

  def setup
    @bar_name = "The Broken Finger"
    @bar_cash = 500
    @bar_drinks = [["Wine", 10],["Gin", 12],["Beer", 5]]
    @bar_tabs = [{guest: "Andy Goram", running_tab: 20}]
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

  def test_room_number
    assert_equal(1, @room1.room_number())
  end

  def test_room_fee
    assert_equal(15, @room2.room_fee_per_guest())
  end

  def test_room_capacity
    assert_equal(6, @room2.room_capacity())
  end

  def test_guests_already_in_room()
    assert_equal(2, @room1.guests_already_in_room())
  end

  def test_songs_in_room()
    assert_equal(3, @room1.songs_in_room)
  end

  # Add selected song to room

  def test_add_song_to_room()
    @room1.add_song_to_room("King of the Road")
    assert_equal(4, @room1.songs_in_room)
  end

  # Is there space in room for new customer?

  def test_room_spaces_left__not_full
     assert(2, @room1.room_spaces_left(@room1.room_capacity))
  end

  # There is no space in the room

  def test_room_spaces_left__full
     assert(0, @room1.room_spaces_left(2))
  end

  # Is guest in room? Yes/no.

  def test_is_guest_in_room__yes()
    assert_equal(true, @room1.is_guest_in_room(@guest2.guest_name))
  end

  def test_is_guest_in_room__no()
    assert_equal(false, @room1.is_guest_in_room(@guest4.guest_name))
  end

  # Remove guest from room

  def test_remove_guest_from_room()
    @room1.remove_guest_from_room(@guest2.guest_name)
    assert_equal(1, @room1.guests_already_in_room)
  end

  # Can guest afford required fee? Yes/no.

  def test_can_guest_afford_fee__yes()
    assert_equal(true,
    @room1.can_guest_afford_fee(@guest3.guest_cash))
  end

  def test_can_guest_afford_fee__no()
    assert_equal(false,
    @room1.can_guest_afford_fee(@guest4.guest_cash))
  end

  # Add guest to room - guest must pay and bar must accept fee.

  def test_add_guest_to_room()
    @room1.add_guest_to_room(@guest5.guest_name, @guest5.guest_cash)
    @guest5.guest_pays(@room1.room_fee_per_guest)
    @bar.bar_accepts_fee(@room1.room_fee_per_guest)
    @room1.compare_songs(@guest5.guest_fav_song)
    assert_equal(3, @room1.guests_already_in_room)
    assert_equal(50, @guest5.guest_cash)
    assert_equal(510,@bar.bar_cash)
    assert_equal("YES! My favourite song!",
       @room1.compare_songs(@guest5.guest_fav_song))
  end

  # Check if guest has a tab

  # def test_does_guest_have_tab()
  #   assert_equal(true, @bar.does_guest_have_tab(@guest3.guest_name))
  # end

  # Guest buys a drink, bar accepts fee

  def guest_buys_drink()
    @guest3.guest_pays(@bar.bar_drinks[1][1])
    @bar.bar_accepts_fee(@bar.bar_drinks[1][1])
    assert_equal(88, @guest3.guest_cash)
    assert_equal(512, @bar.bar_cash)
  end

  # Bar accepts fee, for room or drink

  def test_bar_accepts_fee()
    @bar.bar_accepts_fee(@room1.room_fee_per_guest)
    assert_equal(510,@bar.bar_cash)
  end

  # Guest pays, for room or drink

  def test_guest_pays()
    @guest3.guest_pays(@room1.room_fee_per_guest)
    assert_equal(90, @guest3.guest_cash)
  end

  # The room is full so cannot add guest

  def test_add_guest_to_room__but_room_full()
    @room3.add_guest_to_room(@guest5.guest_name, @guest5.guest_cash)
    assert_equal(2, @room3.guests_already_in_room)
  end


end
