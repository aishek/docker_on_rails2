json.extract! news, :id, :title, :published_at, :created_at, :updated_at
json.url news_url(news, format: :json)
