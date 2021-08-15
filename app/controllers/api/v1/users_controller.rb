class Api::V1::UsersController < ApplicationController
  def index
    render json: { status: 200, users: User.all }
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: { status: 200, user: user }
    else
      render json: { status: 500, message: "Userの作成に失敗しました" }
    end
  end

  def destroy
    user = User.find(params[:id])

    if user.destroy
      render json: { status: 200, user: user }
    else
      render json: { status: 500, message: "Userの削除に失敗しました" }
    end
  end

  private

    def user_params
      params.require(:user).permit(:name)
    end
end
