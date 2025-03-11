require 'sinatra'
require 'slim'
require 'sqlite3'
require 'sinatra/reloader'
require 'bcrypt'

def db_connection 
    db = SQLite3::Database.new("db/databas.db")
    db.results_as_hash = true
    return db
end


get('/')  do
    slim(:start)
  end
  
get('/inlagg') do
   slim(:inlagg)
end


get('/about') do
    slim(:about)
end

get('/image/new') do

slim(:upload_image)
end

post('/image') do
    img = params[:img]
    #Skapa en sträng med join "./public/uploaded_pictures/cat.png"
    path = File.join("./public/img/",params[:file][:filename])
    
    #Spara bilden (skriv innehållet i tempfile till destinationen path)
    File.write(path,File.read(params[:file][:tempfile]))
    db = SQLite3::Database.new("db/databas.db")
    db.execute("INSERT INTO recept (img) VALUES (?)",[img])
    redirect('/inlagg')
   end
   
#    @albums_of_artist1 = db.execute(”SELECT * FROM
#    rel_tbl INNER JOIN albums ON rel_tbl.album_id =
#    album.id WHERE artist_id = 1”)
#    slim(:banan)
#    end  
   
