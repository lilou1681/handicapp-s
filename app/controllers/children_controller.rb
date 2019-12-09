class ChildrenController < ApplicationController
  before_action :authenticate_user!
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  def index
    @children = Children.where(user: current_user)
  end

  def show
    @doc = Doc.new
    if @child.user != current_user
      redirect_to children_path
    else
      @reminder = Reminder.new
      @reminders = Reminder.where(children: @child)
    end
  end

  def new
    user_signed_in?
    @child = Children.new
  end

  def create
    @child = Children.new(children_params)
    @child.user = current_user
    if @child.save
      flash[:notice] = "The child has been registered"
      redirect_to child_path(@child)
    else
      flash[:alert] = "Error, the child couldn't be registered"
      render :new
    end
  end

  def edit
  end

  def update
    @child.update(children_params)
    if @child.save
      flash[:notice] = "The child has been updated"
      redirect_to child_path(@child)
    else
      flash[:alert] = "Error, the child couldn't be updated"
      render :edit
    end
  end

  def destroy
    @child.destroy
    redirect_to children_path
  end

  private

  def set_child
    @child = Children.find(params[:id])
  end

  def children_params
    params.require(:children).permit(:first_name, :last_name, :birth_day, :gender, :nationality, :country, :address, :security_number, :life_project, :photo)
  end
end
