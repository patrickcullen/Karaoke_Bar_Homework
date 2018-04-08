class Guest

  attr_reader :guest_name, :guest_cash, :guest_fav_song

  def initialize(guest_name, guest_cash, guest_fav_song)
    @guest_name = guest_name
    @guest_cash = guest_cash
    @guest_fav_song = guest_fav_song

  end

  # The guest pays fee (for room or drink), guest_cash is decremented

  def guest_pays(fee)
    @guest_cash -= fee
  end

end
