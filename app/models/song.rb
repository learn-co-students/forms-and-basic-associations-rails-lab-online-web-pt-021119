class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  # def genre_id
  #   self.genre ? self.genre.id : nil
  # end

  # def genre_id=(id)
  #   self.genre = Genre.find_or_create_by(id)
  # end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents
    self.notes.collect {|n| n.content }
  end

  def note_contents=(content)
    content.each do |c|
      if !c[0].nil?
        self.notes << Note.find_or_create_by(content: c)
      end
    end
  end

end
