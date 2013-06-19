json.array!(@books) do |book|
  json.extract! book, :title, :author, :isbn
  json.url book_url(book, format: :json)
end
