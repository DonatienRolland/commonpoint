class HardWorker
  include Sidekiq::Worker

  def perform(point)
    if point.date.nil? || point.date == ""
      point.destroy
    end
  end
end
