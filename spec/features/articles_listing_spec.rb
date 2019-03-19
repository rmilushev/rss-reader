require 'rails_helper'

feature 'Listing most recent RSS articles' do
  it 'lists recent articles' do
    articles = [
      instance_double(
        'Article',
        title: 'Article 1',
        link: 'article_link.com',
        pubDate: Date.today,
      )
    ]
    allow(ArticleFetcher).to receive(:get_articles).and_return(articles)
    visit articles_path
    expect(page).to have_content('Article 1')
  end
end
