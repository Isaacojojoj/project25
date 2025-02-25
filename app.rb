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
   slim(:inlagg)
end


get('/about') do
    slim(:about)
end

get('/image/new') do

slim(:upload_image)
end

post('/image') do
    #Skapa en sträng med join "./public/uploaded_pictures/cat.png"
    path = File.join("./public/img/",params[:file][:filename])
    
    #Spara bilden (skriv innehållet i tempfile till destinationen path)
    File.write(path,File.read(params[:file][:tempfile]))
    db = SQLite3::Database.new(”db/store.db”)

    # db.execute(”INSERT INTO recept (img,) VALUES (?,?)”,[img, tel])
    # redirect(’/’)
    
    redirect('/inlagg')
   end
   
   
   
