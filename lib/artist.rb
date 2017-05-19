require 'pry'

class Artist

  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    if @@all.find{|artist| artist.name == name} == nil
        new_artist = Artist.new(name)
        new_artist.save
        new_artist
    else
        @@all.find{|artist| artist.name == name}
    end
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end
end
