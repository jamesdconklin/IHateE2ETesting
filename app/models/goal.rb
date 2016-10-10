class Goal < ActiveRecord::Base

  validates :title, :user, presence: true
  validates :private, :completed, inclusion: {in: [true, false]}

  belongs_to :user
  has_many :comments
end
