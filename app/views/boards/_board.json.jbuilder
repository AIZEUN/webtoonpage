json.extract! board, :id, :user_id, :webtoon_id, :created_at, :updated_at
json.url board_url(board, format: :json)
