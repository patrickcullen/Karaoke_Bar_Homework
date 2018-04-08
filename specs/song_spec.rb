require("minitest/autorun")
require_relative("../song.rb")

class SongTest < MiniTest::Test

  def setup
    @song1 = Song.new("Diamnod in the Back","Curtis Mayfield")
    @song2 = Song.new("Chicken Grease","D'Angelo")
    @song3 = Song.new("Where Are We Going","Marvin Gaye")
    @song4 = Song.new("It's a Shame","Detroit Spinners")
  end

  def test_song_title
    assert_equal("Where Are We Going", @song3.song_title())
  end

  def test_artist_name
    assert_equal("D'Angelo", @song2.artist_name())
  end

end
