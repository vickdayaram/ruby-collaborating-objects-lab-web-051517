require 'pry'

class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)

    file_data_array = file_name.split(" - ")
    file_artist = file_data_array[0]
    file_song_name = file_data_array[1]
    new_song = Song.new(file_song_name)
    new_song.artist = Artist.find_or_create_by_name(file_artist)
    unless new_song.artist.nil?
      new_song.artist.songs << file_song_name
    end
    new_song
  end

end
