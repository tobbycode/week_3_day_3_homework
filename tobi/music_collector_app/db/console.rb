require("pry")
require_relative("../models/collection")
require_relative("../models/music_request")


artist1 = Artist.new({
	  'artist_name' => 'Dbanj'
	  })


	artist2 = Artist.new({
	  'artist_name' => 'Don Moe'
	  })


	artist3 = Artist.new({
	  'artist_name' => 'Take that'
	  })
p Collection.list_all
