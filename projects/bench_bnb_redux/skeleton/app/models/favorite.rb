class Favorite < ApplicationRecord
  validates :user_id, uniqueness: { scope: :bench_id }

  belongs_to :bench
  belongs_to :user
end
