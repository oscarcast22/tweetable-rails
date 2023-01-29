class Tweet < ApplicationRecord
  validates :body, presence: true, length: { maximum: 140 }
  has_many :likes, dependent: :destroy
  has_many :replies, class_name: "Tweet",
                     foreign_key: "replied_to_id",
                     inverse_of: "replied_to",
                     dependent: :destroy,
                     counter_cache: :replies

  belongs_to :replied_to, class_name: "Tweet", optional: true

  belongs_to :user
end
