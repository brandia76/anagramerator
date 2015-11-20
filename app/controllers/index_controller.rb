
get '/' do
  erb :index
end

post '/:word' do
  #check word
  @word = params[:word]
  @anagrams = #list from app
  erb :"show"
end

get '/anagrams/:word' do  
  @word = params[:word]
  @anagrams = Word.find_anagrams(@word)
  erb :show
end

post '/' do 
  @word = params[:word]
  redirect "/anagrams/#{@word}"
end