class UsersController < ApplicationController
  # before_action :set_prototype, only: [:edit, :show]

  def show
    user = User.find(params[:id])
    @prototypes = user.prototypes
    @name = user.name
    @profile = user.profile
    @occupation = user.occupation
    @position = user.position
  end

  private

  # def set_prototype
  #   @prototype = Prototype.find(params[:id])
  # end

end


 # @image_tag = current_user.image_tag
    # @title = current_user."prototype/titles"
    # @catch_copy = current_user.catch_copy

    # Prototype.create(prototype_params)
    # @prototypes = Prototype.new
    # @prototypes = Prototype.find(params[:id])

    # Name.find(params[:name])
