# frozen_string_literal: true
module V1
  module Auth
    class UserTokenController < Knock::AuthTokenController
      skip_before_action :verify_authenticity_token

      def create
        render json: entity, serializer: ::V1::UserSerializer, status: :ok
      end
    end
  end
end
