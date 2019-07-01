# frozen_string_literal: true
module V1
  class UsersController < ApplicationController
    before_action :authenticate_user, only: %i[show destroy]

    def create
      u = User.new(user_params)
      if u.save
        render json: current_user, serializer: UserSerializer, status: :ok
      else
        render json: u.errors.full_messages, status: :bad_request
      end
    end

    def show
      render json: current_user, serializer: UserSerializer, status: :ok
    end

    def destroy
      current_user.destroy!
      head :no_content
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :username)
    end
  end
end
