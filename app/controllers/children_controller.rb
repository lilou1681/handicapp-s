class ChildrenController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  def index
    @children = Children.where(user: current_user)
  end

  def show
  end

  def new
    user_signed_in?
    @child = Children.new
  end

  def create
    @child = Children.new(children_params)
    @child.user = current_user
    if @child.save
      redirect_to child_path(@child)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @child.update(children_params)
    if @child.save
      redirect_to child_path(@child)
    else
      render :edit
    end
  end

  def destroy
    @child.destroy
    redirect_to children_path
  end

  def set_child
    @child = Children.find(params[:id])
  end

  def children_params
    params.require(:children).permit(:first_name, :last_name, :birth_day, :gender, :nationality, :country, :address, :security_number, :life_project, :photo)
  end
end
