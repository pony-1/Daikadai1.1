class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def new
    if params[:back]
      @user = User.new(users_params)
    else
      @user = User.new
    end
  end
  
  def confirm
    @user = User.new(users_params)
    render :new if @user.invalid?
  end
  
  def create
    @user = User.new(users_params)
    # インスタンス変数(@~)コントローラで定義したインスタンス変数はビューで使用できる
    # ビューに渡す
    # コントローラのアクションで定義したインスタンス変数はそのアクションに対応したビューでのみ呼び出せる
    if @user.save
    redirect_to users_path,notice:"つぶやきました！"
    else
    render "new"
    end
  end
  
 
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(users_params)
    redirect_to users_path,notice:"編集しました！"
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path,notice:"削除しました！"
  end
  
 private
  def users_params
  params.require(:user).permit(:title,:content)
  end
  
   def set_user
      @user = User.find(params[:id])
   end
end
