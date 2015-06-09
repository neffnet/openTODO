class User < ActiveRecord::Base
  has_many :lists

  validates_presence_of :name, :password
  validates_uniqueness_of :name
end
