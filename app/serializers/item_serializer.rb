class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :user, :list

  def user
    [object.user.id, object.user.name]
  end

  def list
    [object.list.id, object.list.title]
  end
end
