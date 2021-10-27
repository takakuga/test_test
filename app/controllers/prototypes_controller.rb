class PrototypesController < ApplicationController
  
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    if Prototype.create(prototype_params)
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def prototype_params
    params.require(:prototype).premit(:title, :catch_copy, :concept, :image).marge(user_id: current_user.id)
  end
end
