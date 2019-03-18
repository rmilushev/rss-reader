class ArticleFetcher
  require 'rss'
  def self.get_articles
    articles = []
    Location.all.each do |location|
      rss = Addressable::URI.parse(location.url)
      feed = RSS::Parser.parse(rss)
      feed.items.first(10).each do |article|
        articles << article
      end
    end
    articles.compact.sort_by(&:pubDate).reverse
  end
end
