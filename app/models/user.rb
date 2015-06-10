class User < ActiveRecord::Base
  has_many :lists, dependent: :destroy

  validates_presence_of :name, :password
  validates_uniqueness_of :name
end
