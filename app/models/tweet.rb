class Tweet < ApplicationRecord
  validates :body, presence: true, length: { maximum: 140 }
  has_many :likes, dependent: :destroy
  has_many :replies, class_name: "Tweet",
                     foreign_key: "replied_to_id",
                     inverse_of: "replied_to"

  belongs_to :replied_to, class_name: "Tweet", optional: true, counter_cache: :replies_count, dependent: :destroy

  belongs_to :user
end
