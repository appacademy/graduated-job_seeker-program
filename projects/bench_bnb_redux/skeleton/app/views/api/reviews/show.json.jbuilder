json.review do
  json.partial! '/api/reviews/review', review: @review
end

json.average_rating @review.bench.average_rating
