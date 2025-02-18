require 'sinatra'
require 'slim'
require 'sqlite3'
require 'sinatra/reloader'
require 'bcrypt'

def db_connection 
    db = SQLite3::Database.new("db/chinook-crud.db")
    db.results_as_hash = true
    return db
end


get('/')  do
    slim(:start)
  end
  
get('/inlagg') do
    images = [
        "img/tarta.jpg",
        "img/lax.jpg",
        "img/ägg.jpg"
    ]
    slim(:inlagg, locals: { images: images })
end

post('/inlagg/new') do
    title = params[:title]
    artist_id = params[:artist_id].to_i
    p "Vi fick in datan #{title} och #{artist_id}"
    db = SQLite3::Database.new("db/chinook-crud.db")
    db.execute("INSERT INTO albums (Title, ArtistId) VALUES (?,?)",[title, artist_id])
    redirect('/albums')
  end

get('/inlagg/:inlagg_id') do
    list = ["Apple", "Orange", "Banana", "Grillkorv"]
	fruit_id = params["fruit_id"].to_i

	response = list[fruit_id]

	return response
end

get('/about') do
    slim(:about)
end
