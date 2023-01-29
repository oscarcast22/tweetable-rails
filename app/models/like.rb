class Like < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :tweet, dependent: :destroy, counter_cache: true
end
