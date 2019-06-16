require 'csv'

class AnalysesController < ApplicationController
  def new
    @analysis = Analysis.new
  end

  def create
    @analysis = Analysis.new(analysis_params)
    save
  end

  def index
    @analyses = current_user.analyses
  end

  def show
    @analysis = Analysis.find(params[:id])
  end

  def upload
    keywords = ''
    keywords = CSV.read(analysis_params[:file].path).join("\n") if params[:analysis].present?
    @analysis = Analysis.new(raw_keywords: keywords)
    save
  end

  def save
    @analysis.user = current_user
    if @analysis.save
      redirect_to analysis_path(@analysis)
    else
      flash[:alert] = @analysis.errors[:raw_keywords][0]
      render :new
    end
  end

  private

  def analysis_params
    params.require(:analysis).permit(:raw_keywords, :file)
  end
end
