class FeedsController < ApplicationController
  def index
    @entries = Feed.feed_entries
  end

  def links
    # @links = Feeds.links_array
  end
end
