get '/words' do
	@words = Word.all.order("text ASC")
	erb :"/words/index"
end
  
get '/words/new' do 
  @word = Word.new
  erb :"/words/new"
end

post '/words/new' do 
  @word = Word.new(text: params[:text])
  puts "new word"
  if @word.valid?
    @word.save
    redirect "/words/#{@word.id}"
  else
    get_errors()
    erb :"/words/new"
  end
end

get '/words/:id/edit' do
  @word = find_word(params[:id])
  erb :"/words/edit"
end

put '/words/:id' do 
  @word = find_word(params[:id])
  if @word  
    @word.text = params[:text]
    
    if @word.valid?
      @word.save
      redirect "/words/#{@word.id}"
    else  
      get_errors()
      erb :"/words/edit"
    end
  else
    erb :"/words/new"
  end
end

get '/words/:id' do
  @word = find_word(params[:id])
  erb :"words/show"
end

delete '/words/:id' do  
  find_word(params[:id]).delete
  redirect "/words"
end

def find_word(id)
  begin
    Word.find(id)
  rescue ActiveRecord::RecordNotFound 
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
