class Feed < ActiveRecord::Base
  URLS = %w[https://scotthelme.co.uk/rss/ https://www.schneier.com/blog/atom.xml http://feeds.wired.com/WiredDangerRoom http://feeds.wired.com/wired27b http://feeds2.feedburner.com/RogersInfosecBlog http://www.darkreading.com/rss_simple.asp http://krebsonsecurity.com/feed/ http://dankaminsky.com/feed/]

  def self.feeds
    [].tap do |feeds|
      URLS.each do |url|
        feeds << Feedjira::Feed.fetch_and_parse(url)
      end
    end
  end

  def self.feed_entries
    entries = []
    Feed.feeds.each do |feed|
      entries += feed.entries
    end
    entries.sort_by { |feed| feed.published }.reverse
  end

  def self.readable_date(date)
    date.strftime("%A, %b %d")
  end

  def self.author(author)
    author || "Unknown"
  end

  def self.links_array
    URLS.each do
      fail
    end
  end
end
