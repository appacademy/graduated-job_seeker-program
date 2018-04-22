@benches.each do |bench|
  json.set! bench.id do
    json.partial! 'bench', bench: bench
    json.reviewIds []
  end
end
