class UsersController < ApplicationController

  def show
    @name = current_user.name
    @profile = current_user.profile
    @occupation = current_user.occupation
    @position = current_user.position

    user = User.find(params[:id])
    @prototypes = user.prototypes
    # @image_tag = current_user.image_tag
    # @title = current_user."prototype/titles"
    # @catch_copy = current_user.catch_copy

    # Prototype.create(prototype_params)
    # @prototypes = Prototype.new
    # @prototypes = Prototype.find(params[:id])
  end

end
