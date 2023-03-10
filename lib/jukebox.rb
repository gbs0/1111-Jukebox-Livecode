class Jukebox
  def self.all_artists_names(db)
    result = db.execute("SELECT name FROM artists")
    # db.execute....
  end


  def self.first_ten_albums(db)
    result = db.execute("SELECT title FROM albums ORDER BY title ASC LIMIT 10")
    result.flatten
  end

  def self.count_short_tracks(db)
    result = db.execute("SELECT COUNT(*) FROM tracks WHERE milliseconds < 2*60*1000")
    result.flatten.first
  end
end