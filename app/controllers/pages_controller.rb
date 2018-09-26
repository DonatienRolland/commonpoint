class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def dashboard
    @user = current_user
    points = @user.points.where(date: nil)
    if points.count > 0
      points.each do |point|
        if point.date.nil? || point.date == ""
          if point.created_at < 1.minutes.ago
            point.destroy
          end
        end
      end
    end

  end
end

