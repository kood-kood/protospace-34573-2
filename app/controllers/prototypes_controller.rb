class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:destroy]
  #この記述でログアウト状態のユーザーは、プロトタイプ新規投稿ページ・プロトタイプ編集ページに遷移しようとすると、ログインページにリダイレクトされる
  
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :move_to_index, except: [:index,:show]


  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    # prototype = Prototype.find(params[:id])
    #  if prototype.user_id == current_user.id
    #   prototype.destroy #destroyメソッドを使用し対象のツイートを削除する。
    #  end
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to prototypes_path
  end

  def edit
    @prototype = Prototype.find(params[:id])
    unless @prototype.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path
    else
      render :edit
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  
  private

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  # end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  # def set_prototype
  #   @prototype = Prototype.find(params[:id])
  # end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
