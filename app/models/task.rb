class Task < ApplicationRecord
  belongs_to :user
  belongs_to :tag

  validates :name, presence: true, length: { maximum: 64 }
  validates :description, length: { maximum: 512 }
  validates :expire_date, presence: true
end
