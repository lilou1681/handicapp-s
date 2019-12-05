class RemindersController < ApplicationController
  def create
    @reminder = Reminder.new(reminders_params)
    @child = Children.find(params[:child_id])
    @reminder.children = @child
    if @reminder.save
      flash[:notice] = "The reminder has been registered"
      ReminderJob.set(wait_until: @reminder.date - 1.day).perform_later
      redirect_to child_path(@child)
    else
      flash[:alert] = "Error, the reminder couldn't be registered"
      redirect_to child_path(@child)
    end
  end

  private

  def reminders_params
    params.require(:reminder).permit(:name, :date)
  end
end
