class AlbumsController < ApplicationController
  active_scaffold do |config|
    config.columns = [:title, :release_date]
    config.list.sorting = {:title => :asc}
    config.columns[:release_date].label = "Release Date"
    config.label = "CDs"
  end
end
