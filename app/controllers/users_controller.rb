# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin, only: [:create]
  include Rails.application.routes.url_helpers

  def new
    @user = User.new
  end

  def postulantes
    @postulantes = User.with_attached_profile_picture
    @users = User.includes(:postulations)
  end

  def show
    @user = User.find_by(id: params[:id])

    if @user.nil?
      redirect_to root_path, alert: "El usuario no existe."
    end
  end


  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Usuario creado exitosamente."
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user, notice: 'Perfil actualizado correctamente.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :admin, :profile_picture, :relevant_data)
  end

  def authorize_admin
    unless current_user.admin?
      redirect_to root_url, alert: "No tienes permiso para acceder a esta página."
    end
  end
end
