class Room

  attr_reader :room_number, :room_fee_per_guest, :room_capacity, :room_guests, :room_songs

  def initialize(room_number, room_fee_per_guest, room_capacity, room_guests, room_songs)
    @room_number = room_number
    @room_fee_per_guest = room_fee_per_guest
    @room_capacity = room_capacity
    @room_guests = room_guests
    @room_songs = room_songs
  end

  def guests_already_in_room()
    return @room_guests.count
  end

  def songs_in_room()
    return @room_songs.count
  end

  # Add supplied song to room

  def add_song_to_room(song)
    room_songs.push(song)
  end

  # Calculate number of spaces left in room by subtracting guest count from capacity

  def room_spaces_left(capacity)
    return (capacity - @room_guests.count)
  end

  # Is supplied guest in the room?

  def is_guest_in_room(guest)
    for name in room_guests
      if name == guest
        return true
      end
    end
    return false
  end

  # Remove supplied guest from room only if guest is in the room

  def remove_guest_from_room(guest)
    if is_guest_in_room(guest) == true
      room_guests.delete(guest)
    end
  end

  # Can guest afford required fee for room or drink?

  def can_guest_afford_fee(cash)
    cash > room_fee_per_guest ? true : false
  end

  # Check if customer's supplied favourite song appears in room's songs

  def compare_songs(song)
    for room_song in @room_songs
      if song == room_song
        return "YES! My favourite song!"
      end
    end
  end

  # Add supplied guest to room if there is space in room and if guest can afford it

  def add_guest_to_room(guest, cash)
    if room_spaces_left(room_capacity) > 0 &&
      can_guest_afford_fee(cash) == true
        room_guests.push(guest)
    end
  end



end
