class Item < ActiveRecord::Base
  belongs_to :list

  validates_presence_of :name
  validates_uniqueness_of :name, scope: :list_id
end
