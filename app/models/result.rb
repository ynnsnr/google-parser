class Result < ApplicationRecord
  belongs_to :analysis
  validates :keyword, presence: true, uniqueness: { scope: :analysis }
  default_scope -> { order(:position) }

  after_create :broadcast_result

  def broadcast_result
    ActionCable.server.broadcast("analysis_#{analysis.id}", {
      result_row: ApplicationController.renderer.render(
        partial: 'results/result',
        locals: { result: self }
      )
    })
  end
end
