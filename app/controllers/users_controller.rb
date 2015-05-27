class UsersController < ApplicationController

  add_breadcrumb :index, :users_path

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # remove password en confirmation if empty
    p = user_params
    p = p.tap{|x| x.delete(:password)} if user_params[:password].empty?
    p = p.tap{|x| x.delete(:password_confirmation)} if user_params[:password_confirmation].empty?

    respond_to do |format|
      if @user.update(p)
        Devise::LDAP::Adapter.update_password(@user.username, p[:password]) if p[:password]
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
      add_breadcrumb @user.username
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :username, :firstname, :lastname, :created_at, :update_at, :role_ids => [])
    end
end
