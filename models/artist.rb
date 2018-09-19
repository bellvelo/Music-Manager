require('pg')
require_relative('../db/sql_runner')

class Artist

attr_reader :id
attr_accessor :name

def initialize(options)
  @id = options["id"].to_i if options["id"]
  @name = options["name"]
end

def save
  sql = "INSERT INTO artists (name) VALUES ($1) RETURNING *"
  values =[@name]
  artist = SqlRunner.run(sql, values)
  @id = artist[0]["id"].to_i
end

def self.all
  sql = "SELECT * FROM artists"
  artists = SqlRunner.run(sql)
  return artists.map {|artist_hash| Artist.new(artist_hash)}
end

def self.delete_all
  sql ="DELETE FROM artists"
  SqlRunner.run(sql)
end

def albums
  sql = "SELECT * FROM albums WHERE artist_id = $1"
  values = [@id]
  result = SqlRunner.run(sql, values)
  return result.map {|album| Album.new(album)}
end

def update()
  sql = "UPDATE artists SET name = $1"
  values = [@name]
  SqlRunner.run(sql, values)
end
#this is the end
end
