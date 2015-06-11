class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  validates_uniqueness_of :title, scope: :user_id
  validates :permissions, inclusion: { in %w(open public private), message: "permissions must be set to 'private', 'public', or 'open'" }, presence: true
end
