require('pg')
require('pry')
require_relative('../models/artist')
require_relative('../models/album')

artist1 = Artist.new ({
  "name" => "David Bowie"
  })

artist1.save()

album1 = Album.new ({
  "title" => "Spiders from Mars",
  "genre" => "Psych-Rock",
  "artist_id" => artist1.id
  })
album2 = Album.new ({
  "title" => "Ziggy Stardust",
  "genre" => "Space-Rock",
  "artist_id" => artist1.id
  })

album1.save()


binding.pry
nil
