json.extract! user, :id, :username
json.favorite_benches user.favorite_benches.pluck(:id)
