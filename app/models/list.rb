class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  validates_uniqueness_of :title, scope: :user_id
  validates :permissions, inclusion: { in: %w(open viewable private), message: "must be set to 'private', 'public', or 'open'" }
end
