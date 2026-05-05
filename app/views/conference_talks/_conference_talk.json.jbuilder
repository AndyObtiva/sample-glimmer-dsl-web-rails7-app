json.extract! conference_talk, :id, :title, :speaker, :track, :description, :bio, :created_at, :updated_at
json.url conference_talk_url(conference_talk, format: :json)
