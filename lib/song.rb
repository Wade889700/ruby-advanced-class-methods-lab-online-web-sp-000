class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    filename.slice!".mp3"
    filename = filename.split(" - ")
    song = self.new
    song.artist_name = filename[0]
    song.name = filename[1]
    song
  end

  def self.create_from_filename(filename)
    filename.slice!".mp3"
    filename = filename.split(" - ")
    song = self.new
    song.artist_name = filename[0]
    song.name = filename[1]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
