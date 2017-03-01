require 'rails_helper'

feature 'Inspector creates report' do
  scenario 'is successful' do
    visit '/'
    expect(page).to have_css('h1', text: 'Tundra')
  end
end
