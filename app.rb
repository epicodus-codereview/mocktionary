require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definition')
require('./lib/word')

get('/') do
  @words = Word.all
  erb(:index)
end

post('/words') do
  new_word = Word.new(params.fetch('new_word'))
  new_word.save
  @words = Word.all
  redirect('/')
end

get('/definition/:id') do
  @word = Word.find(params.fetch('id').to_i)
  erb(:definition)
end

post('/definition') do
  @word = Word.find(params.fetch("word_id").to_i)
  new_def = Definition.new(params.fetch('new_def'))
  @word.add_definition(new_def)
  erb(:definition)
end
