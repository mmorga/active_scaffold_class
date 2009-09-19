module AlbumsHelper
  def release_date_column(record)
    record.release_date.strftime("%m/%d/%Y")
  end
end
