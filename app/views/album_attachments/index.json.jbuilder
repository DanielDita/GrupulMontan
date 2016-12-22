json.array!(@album_attachments) do |album_attachment|
  json.extract! album_attachment, :id, :album_id, :avatar
  json.url album_attachment_url(album_attachment, format: :json)
end
