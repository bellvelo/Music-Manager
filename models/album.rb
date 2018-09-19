require('pg')

class Album

attr_accessor :title, :genre, :artist_id
attr_reader :id

def initialize(options)
  @title = options["title"]
  @genre = options["genre"]
  @id = options["id"].to_i if options["id"]
  @artist_id = options["artist_id"].to_i
end

def save
  sql = "INSERT INTO albums (title, genre, artist_id)
  VALUES ($1, $2, $3) RETURNING * "
  values = [@title, @genre, @artist_id]
  result = SqlRunner.run(sql, values)
  @id = result[0]["id"].to_i
end

def self.all
  sql = "SELECT * FROM albums"
  albums = SqlRunner.run(sql)
  return albums.map {|album_hash| Album.new(album_hash)}
end

def self.delete_all
  sql = "DELETE FROM albums"
  SqlRunner.run(sql)
end

def artists
  sql = "SELECT * FROM artists WHERE id = $1"
  values = [@artist_id]
  result = SqlRunner.run(sql, values)
  return Artist.new(result[0])
end

def update()
  sql = "UPDATE albums SET (title, genre, artist_id)
      = ($1, $2, $3) WHERE id = $4"
  values = [@title, @genre, @artist_id, @id]
  SqlRunner.run(sql, values)
end


#this is the end
end
