require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definition')
require('./lib/word')
require('pry')

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
  new_def.save
  @word.add_definition(new_def)
  erb(:definition)
end

post('/delete_word') do
  @word = Word.find(params.fetch("word_id").to_i)
  @word.delete()
  redirect('/')
end

post('/delete_def') do
  @word = Word.find(params.fetch("word_id").to_i)
  def_selected = Definition.find(params.fetch("def_id").to_i)
  @word.delete_definition(def_selected)
  erb(:definition)
end
