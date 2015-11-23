get '/words' do
	@words = Word.all.order("text ASC")
	erb :"/words/index"
end
  
get '/words/new' do 
  erb :"/words/new"
end

post '/words' do 
  @word = Word.new(text: params[:word])
  
  if @word.valid?
    @word.save
    redirect "/words"
  else
    get_errors()
    erb :"/words/new"
  end
end

get '/words/:id' do 
  @word = find_word(params[:id])
  print @word
  erb :"/words/show"
end

def find_word(id)
  begin
    Word.find(id)
  rescue ActiveRecord::RecordNotFound => e
    redirect "/words"
  end
end

def get_errors()
  @errors = ''
  @word.errors.full_messages.each do |message|
    @errors = "#{@errors} #{message}. <br />"
  end
  return @errors
end
