require('pg')
require('pry')
require_relative('../models/artist')
require_relative('../models/album')


# Album.delete_all()
# Artist.delete_all()


artist1 = Artist.new ({
  "name" => "David Bowie"
  })

# artist1.name = "Frank Zappa"
# artist1.update()

artist2 = Artist.new ({
  "name" => "Radiohead"
  })

artist1.save()
artist2.save()

album1 = Album.new ({
  "title" => "Spiders from Mars",
  "genre" => "Psych-Rock",
  "artist_id" => artist1.id
  })
album1.title = "Spiders from Venus"
album1.update()  
album2 = Album.new ({
  "title" => "Ziggy Stardust",
  "genre" => "Space-Rock",
  "artist_id" => artist1.id
  })
album3 = Album.new ({
  "title" => "Rainbows",
  "genre" => "Indi_Rock",
  "artist_id" => artist2.id
  })

album1.save()
album2.save()
album3.save()


binding.pry
nil
