class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :permissions, :items, :user
  has_many :items

  def user
    [object.user.id, object.user.name]
  end

  def items
    object.items.collect {|item| [item.id, item.name]}
  end
end