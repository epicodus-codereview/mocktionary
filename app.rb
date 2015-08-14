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
