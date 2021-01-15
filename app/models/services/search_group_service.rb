class SearchTweetService
  def self.search(search)
    if search != ""
      search = "%#{search}%"
    Tweet.find_by_sql(search)
    else
      Tweet.all
    end
  end
end
