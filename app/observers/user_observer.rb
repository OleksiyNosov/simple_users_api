class UserObserver < ActiveRecord::Observer
  def after_create(user)
    UserMailer.welcome_mail(user).deliver_later
  end
end