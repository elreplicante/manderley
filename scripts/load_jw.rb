require 'json'
 
 
def to_minutes b
  if b== "N/A"
    0
  elsif b.index('h')
    b.to_i*60 + b[b.index('h')..-1].to_i
  else
    b.to_i
  end
end

def create_movie_from_json json
  Movie.create title: json["Title"], duration: to_minutes(json["Runtime"]), year: json["Year"], synopsis: json["Plot"], categories: json["Genre"]
end
 
def load_movies_from_file(file)
  File.foreach(file) do |l|
    unless l.blank?
      json = JSON.parse(l)
      create_movie_from_json(json)
    end
  end
end
 
def load_default_file
  current_dir = File.dirname(__FILE__)
  file = File.join(current_dir, 'jw.json')
  load_movies_from_file file
end