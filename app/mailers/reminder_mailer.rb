class ReminderMailer < ApplicationMailer
  default from: "handicapps2019@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reminder_mailer.notification.subject
  #
  def notification
    @reminder = params[:reminder]
    @user = @reminder.children.user # Instance variable => available in view
    mail(
      to: @user.email,
      subject: "Rappel pour #{@reminder.name} du #{@reminder.date}")
    # This will render a view in `app/views/user_mailer`!
  end
end
