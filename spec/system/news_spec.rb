require 'system_spec_helper'

RSpec.describe "News", type: :system do
  it 'renders news page' do
    visit '/news'

    expect(page).to have_content('News')
  end
end
