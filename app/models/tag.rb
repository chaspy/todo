class Tag < ApplicationRecord
  has_many :tasks
  belongs_to :user
  validates :name, presence: true, length: { maximum: 64 }
end
