require('pg')
require('pry')
require_relative('../models/artist')
require_relative('../models/album')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new ({
  "name" => "David Bowie"
  })
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

all_albums = Album.all()
all_artists = Artist.all()
album_search = Album.search_album_by_id(album1.id)
artist_search = Artist.search_artist_by_id(artist2.id)

# album1.title = "Spiders from Venus"
# album1.update()
# artist1.name = "Frank Zappa"
# artist1.update()

# artist1.delete() # unable to get this to run as am getting following ERROR
# ERROR:  update or delete on table "artists" violates foreign key constraint "albums_artist_id_fkey" on table "albums" (PG::ForeignKeyViolation)
# DETAIL:  Key (id)=(43) is still referenced from table "albums".
# album3.delete()
# album1.delete()

binding.pry
nil
