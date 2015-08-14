require('capybara/rspec')
require('./app')
require('pry')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add word path', {:type => :feature}) do
  it('processes the user entry to add a word to the list of words') do
    visit('/')
    fill_in('new_word', :with => 'ataraxia')
    click_button('Add Word')
    expect(page).to have_content('ataraxia')
  end
end
