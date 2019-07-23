class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(notes_array)
    notes_array.each do |note|
      unless note == ""
        result = Note.find_or_create_by(content: note)
        result ? self.notes << result : nil
      end
    end
    self.notes
  end

  def note_contents
    notes_content_array = []
    self.notes.each do |note|
      notes_content_array << note.content
    end
    notes_content_array
  end


end
