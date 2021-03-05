class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new #creates new instance of song
    song.save #save the new instance 
    song #return the individual song
  end

  def self.new_by_name(name) #test says need 1 argument
    song = self.new #creates new instance of a song 
    song.name = name #save the song name with variable name
    song #return the song 
    #this is making a new song instance but not saving
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
    #this creates a new song by name and SAVES it 
  end
  
  def self.find_by_name(name)
    #we need to iterate through the all array to find songs
    self.all.find{ |song| song.name == name }
    #iterate through the song and see if the name matches name argument we pass in
  end

  def self.find_or_create_by_name(song_name)
    #this is asking us to not repeat the code written for 
    #these tests but to use the helper methods that we have already written
    #find this song by a name, if you cant find this, create the song
    self.find_by_name(song_name) || self.create_by_name(song_name)
    # || = "or" if it the first part is true, it will stop, if it's not it will move on to the second part of the ||
     
  end

  def self.alphabetical
    #use sort_by method
    #returns all song instances in alpha order or song name
    self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename)
    #we will need split on - and take of MP3
    song_parts = filename.split(" - ") #setting variable song_parts to file_name.split
    artist_name  = song_parts[0] #using attr accessor artist_name and setting it to song parts and calling index 0 on array, which is the song artist
    song_name = song_parts[1].gsub(".mp3", "") #Gsub means find .mp3 and then replace it with nothing

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end


  def self.create_from_filename(filename)
    song_parts = filename.split(" - ") 
    artist_name  = song_parts[0] 
    song_name = song_parts[1].gsub(".mp3", "") 

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end 


end
