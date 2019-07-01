# frozen_string_literal: true
module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :email, :username, :auth_token
  end
end
