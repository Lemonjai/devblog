json.array!(@blogs) do |blog|
  json.extract! blog, :id, :name, :summary, :description
  json.url blog_url(blog, format: :json)
end
