class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.passive_notifications.includes([:visitor,:visited,:teacher_post,:student_post]).page(params[:page]).order('created_at DESC').per(10)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end

