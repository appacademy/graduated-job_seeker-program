json.bench do
  json.partial! '/api/benches/bench', bench: @bench
  json.reviewIds @bench.reviews.pluck(:id)
end

json.reviews do
  @bench.reviews.each do |review|
    json.set! review.id do
      json.partial! 'api/reviews/review', review: review
    end
  end
end
