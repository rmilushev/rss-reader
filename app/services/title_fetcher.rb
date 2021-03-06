class TitleFetcher
  require 'rss'
  def self.get_channel_title(url)
    rss = Addressable::URI.parse url
    feed = RSS::Parser.parse(rss)
    feed.channel.title if feed
  rescue RSS::NotWellFormedError, RSS::NotAvailableValueError,
    Addressable::URI::InvalidURIError
      return nil
  end
end
