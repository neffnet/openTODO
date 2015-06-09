class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :user, :list

  def user
    [object.list.user.id, object.list.user.name]
  end

  def list
    [object.list.id, object.list.title]
  end
end
