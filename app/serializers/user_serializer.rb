class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at

  def name
    object.name
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
