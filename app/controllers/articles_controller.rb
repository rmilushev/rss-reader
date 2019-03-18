class ArticlesController < ApplicationController
  def index
    @articles = ArticleFetcher.get_articles
  end
end
