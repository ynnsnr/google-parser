class AnalysisChannel < ApplicationCable::Channel
  def subscribed
    stream_from "analysis_#{params[:analysis_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
