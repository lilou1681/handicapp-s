class ReminderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reminder_mailer.notification.subject
  #
  def notification(reminder)
    @reminder = reminder
    @user = reminder.children.user # Instance variable => available in view
    mail(
      to: @user.email,
      subject: "Rappel pour #{reminder.name} d'aujourd'hui")
    # This will render a view in `app/views/user_mailer`!
  end
end
