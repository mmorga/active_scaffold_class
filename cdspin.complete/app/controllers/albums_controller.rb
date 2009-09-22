class AlbumsController < ApplicationController
  active_scaffold do |config|
    config.columns = [:title, :release_date, :price, :artists]
    config.list.sorting = {:title => :asc}
    config.columns[:release_date].label = "Release Date"
    config.columns[:release_date].options = {:year_range => 1900..Date.today.year}
    config.columns[:artists].form_ui = :select
    config.label = "CDs"
  end
end
