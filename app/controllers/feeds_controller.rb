class FeedsController < ApplicationController
  def index
    @entries = Feed.feed_entries
  end
end
