class YoutubesController < ApplicationController


  def find_videos(keyword, after: 1.months.ago, before: Time.now)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = "AIzaSyCncaj1O4oabCnZxHi6LR5b7xYu-s6QcgA"

    next_page_token = nil
    opt = {
      q: keyword,
      type: 'video',
      max_results: 3,
      order: :date,
      page_token: next_page_token,
      published_after: after.iso8601,
      published_before: before.iso8601
    }
    service.list_searches(:snippet, opt)
  end

  def index
    @youtube_data = find_videos('ホロライブ')
  end
end
