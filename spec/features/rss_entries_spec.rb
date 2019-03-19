require 'rails_helper'

feature 'Listing RSS entries and changing them' do
  it 'lists rss feeds' do
    create(:location)
    create(:location, title: 'Another RSS feed')
    visit root_path
    expect(page).to have_content 'RSS feed'
    expect(page).to have_content 'Another RSS feed'
  end

  context 'with valid rss feed url' do
    it 'creates a new rss entry' do
      allow(TitleFetcher).to receive(:get_channel_title).and_return('Ruby News')
      visit root_path
      click_on 'Add a new RSS feed'
      fill_in('location_url', with: 'http://www.ruby-lang.org/en/feeds/news.rss')
      click_on 'Save'
      expect(page).to have_content 'Ruby News'
    end
  end

  context 'with invalid rss feed url' do
    it 'creates error when title is nor present' do
      allow(TitleFetcher).to receive(:get_channel_title).and_return(nil)
      visit root_path
      click_on 'Add a new RSS feed'
      fill_in('location_url', with: 'http://www.ruby-lang.org/en/feeds')
      click_on 'Save'
      expect(page).to have_content 'Not valid rss feed url'
    end
  end

  it 'updates an entry' do
    create(:location)
    visit root_path
    click_on 'Edit'
    fill_in('location_url', with: 'https://hnrss.org/newest')
    allow(TitleFetcher).to receive(:get_channel_title).and_return('Hacker News')
    click_on 'Save'
    expect(page).to have_content 'Hacker News'
  end

  it 'removes an entry' do
    create(:location)
    visit root_path
    expect {
      click_on 'Destroy'
    }.to change(Location, :count).by(-1)
  end
end
