class OpinionsController < ApplicationController
  
  before_filter :survey
  
  # GET /surveys/1/opinions
  def index
    @opinions = @survey.opinions
  end

  # GET /surveys/1/opinions/1
  def show
    @opinion = @survey.opinions.find params[:id]
  end

  # GET /surveys/1/opinions/new
  def new
    @opinion = @survey.opinions.build
  end

  # POST /surveys/1/opinions
  def create
    @opinion = @survey.opinions.build(params[:opinion])
    if @opinion.save
      redirect_to survey_url(@survey)
    else
      render :action => :new
    end
  end
  
  def edit
    @opinion = @survey.opinions.find(params[:id])
  end

  # PUT /surveys/1/opinions/1/
  def update
    @opinion = @survey.opinions.find params[:id]
    if @opinion.update_attributes params[:opinion]
      redirect_to survey_opinions_url(@survey)
    else
      render :action => :edit
    end
  end

  def destroy
    @survey.opinions.find(params[:id]).destroy
    redirect_to survey_opinions_url(@survey)
  end

  private

  def survey
    @survey = Survey.find params[:survey_id]
  end

end
