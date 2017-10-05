require 'pg'
require_relative '../db/sql_runner'
require_relative '../models/music_request'


class Collection

attr_accessor :artist_id, :collection_title, :genre
attr_reader :id

def initialize(options)
  @artist_id = options['artist_id']
  @collection_title = options['collection_title']
  @genre = options['genre']
  @id = options['id'].to_i if options['id']

end


# C R U D

def save()
  sql = "INSERT INTO collection (artist_name, collection_title, genre) VALUES ($1, $2, $3) RETURNING id;"
  values = [@artist_name, @collection_title, @genre]
  result = SqlRunner.run(sql, values)
  @id = result[0]['id'].to_i
end

def self.list_all()
  sql = "SELECT * FROM collection;"
  values = []
  album_hashes = SqlRunner.run(sql, values)
  collection = collection_hashes.map { |collection| Collection.new( collection ) }
  return collection
end

#
def list_collection_by_artist(artist_id)
  sql = "SELECT * FROM albums WHERE artist_id = $1;"
  values = [artist_id]
  results = SqlRunner.run(sql, values)
  collection = Collection.new(results)
  return collection
end
#
def list_artist_by_collection(collection_title)
  sql = "SELECT * FROM artist_id WHERE collection_title = $1"
  values = [collection_title]
  results = SqlRunner.run(sql, values)
  artists = Collection.new(results)
  return artists
end
#
def self.delete_all()
  sql = "DELETE FROM collection"
  values = []
  SqlRunner.run(sql, values)
end


end
