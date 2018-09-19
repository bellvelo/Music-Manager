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



#this is the end
end
