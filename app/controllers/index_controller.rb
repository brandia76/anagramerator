
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
  alphabetized_string = @word.chars.sort.join
  @anagrams = Word.where("letters=?", alphabetized_string) #Word.find_anagrams(@word)
  erb :show
end

post '/' do 
  @word = params[:word]
  begin
    valid_input?(@word)  
    redirect "/anagrams/#{@word}" 
  rescue Exception => error 
    @error = error.message
    erb :index
  end
  
end

def three_letters?(input)
  input.length <= 3
end

def distint_letters?(input)
  input.chars.uniq.length >= input.length
end

def valid_input?(input)
  unless three_letters?(input) && distint_letters?(input)
    raise Exception.new("Please enter a 3 letter word with no repeating letters.")
  end
end

