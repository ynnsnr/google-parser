class AnalysesController < ApplicationController
  def new
    @analysis = Analysis.new
  end

  def create
    @analysis = Analysis.new(analysis_params)
    @analysis.user = current_user
    if @analysis.save
      redirect_to analysis_path(@analysis)
    else
      render :new
    end
  end

  def index
    # @analysis = current_user.analysis
  end

  def show
    @analysis = Analysis.find(params[:id])
  end

  private

  def analysis_params
    params.require(:analysis).permit(:raw_keywords)
  end
end
