class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist 
  belongs_to :genere 
  has_many :notes 
  
 def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre.name if self.genre
  end

  def artist_name
    self.artist.name if self.artist
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
	def note_contents=(content)
    content.each do |content|
      self.notes << Note.find_or_create_by(content: content)
    end
  end

  def note_contents
    array = []
    self.notes.each do |note|
      array << note.content unless note.content.empty?
    end
    array
  end

	
	
