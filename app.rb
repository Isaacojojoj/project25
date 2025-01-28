require 'sinatra'
require 'slim'
require 'sqlite3'
require 'sinatra/reloader'
require 'bcrypt'

get('/')  do
    slim(:start)
  end
  
get('/inlagg') do
    db = SQLite3::Database.new("db/chinook-crud.db")
    db.results_as_hash = true
    result = db.execute("SELECT * FROM albums")
    p result
    slim(:"albums/index",locals:{albums:result})
end

get('inlagg/:inlagg_id') do
    list = ["Apple", "Orange", "Banana", "Grillkorv"]
	fruit_id = params["fruit_id"].to_i

	response = list[fruit_id]

	return response
end
