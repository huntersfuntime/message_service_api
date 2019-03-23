class NotificationsController < ApplicationController
  include SmsTool

  def create
    @notification = Notification.create(notification_params)
    
    respond_to do |format|
      if @notification.save
        SmsTool.send_sms('555555555', 'A message', 'my app')
      format.json { render action: 'show', status: :created, location: @notification}
      else
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private

  def notification_params
    params.require(:notification).permit(:phone, :body, :source_app)
  end
end
