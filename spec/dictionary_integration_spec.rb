require('capybara/rspec')
require('./app')
require('pry')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add word path', {:type => :feature}) do
  it('processes the user entry to add a word to the list of words') do
    visit('/')
    fill_in('new_word', :with => 'splendiferous')
    click_button('Add Word')
    expect(page).to have_content('splendiferous')
  end
end

describe('the see definition path', {:type => :feature}) do
  it('navigates to the link with the definition of the selected word') do
    visit('/')
    fill_in('new_word', :with => 'viscosity')
    click_button('Add Word')
    click_link('viscosity')
    expect(page).to have_content('viscosity')
  end
end

describe('the add definition path', {:type => :feature}) do
  it('processes the user entry to add to the definitions of the word') do
    visit('/')
    fill_in('new_word', :with => 'ataraxia')
    click_button('Add Word')
    click_link('ataraxia')
    fill_in('new_def', :with => 'A condition characterized by freedom from worry or any other pre-occupation of reality.')
    click_button('Add Definition')
    expect(page).to have_content('A condition characterized by freedom from worry or any other pre-occupation of reality.')
  end
end
