require "sqlite3"

def artist_count(db)
  results = db.execute("SELECT COUNT(*) FROM artists;")
  results.flatten.first
  # TODO: use `db` to execute an SQL query against the database.
  # Should return an integer of the number of artists.
end

def number_of_rows(db, table_name)
  results = db.execute("SELECT COUNT(*) FROM #{table_name};")
  results.flatten.first
  # TODO: count number of rows in table table_name.
  # Should return an integer of the number of rows.
end

def sorted_artists(db)
  results = db.execute("SELECT name FROM artists ORDER BY name ASC;")
  results.flatten
  # TODO: return array of artists' names sorted alphabetically.
  # Should return an array of strings sorted alphabetically.
end

def love_tracks(db)
  results = db.execute("SELECT name FROM tracks WHERE name LIKE '%love%';")
  results.flatten
  # TODO: return array of love songs' names.
  # Should return an array of strings (track names).
end

def long_tracks(db, min_length)
  results = db.execute("SELECT name FROM tracks WHERE milliseconds > #{min_length * 60_000} ORDER BY milliseconds ASC;")
  results.flatten
  # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending).
  # Should return an array of strings.
end

def albums_per_artist(db)
  query = <<~SQL
    SELECT artists.name, COUNT(*) AS album_count
    FROM artists
    JOIN albums ON artists.id = albums.artist_id
    GROUP BY artists.name;
  SQL
  results = db.execute(query)
  # TODO: return an array of arrays, each containing the artist's name and the number of albums they have
end
