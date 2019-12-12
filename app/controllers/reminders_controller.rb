class RemindersController < ApplicationController
  def create
    @reminder = Reminder.new(reminders_params)
    @child = Children.find(params[:child_id])
    @reminder.children = @child
    if @reminder.save
      flash[:notice] = "The reminder has been registered"
      notif = ReminderMailer.with(reminder: @reminder).notification
      notif.deliver_now
      redirect_to child_path(@child)
    else
      flash[:alert] = "Error, the reminder couldn't be registered"
      redirect_to child_path(@child)
    end
  end

  def destroy
    @reminder = Reminder.find(params[:child_id])
    @reminder.destroy
    redirect_to child_path(@reminder.children)
  end

  private

  def reminders_params
    params.require(:reminder).permit(:name, :date)
  end
end
