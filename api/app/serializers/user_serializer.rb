class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :pid, :role
  has_many :courses
  has_many :assignments
end
