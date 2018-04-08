class Song

  attr_reader :song_title, :artist_name

  def initialize(song_title, artist_name)
    @song_title = song_title
    @artist_name = artist_name
  end

end
