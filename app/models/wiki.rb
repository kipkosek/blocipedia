class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true
end
