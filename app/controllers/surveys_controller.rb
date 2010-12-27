class SurveysController < ApplicationController
  # GET /surveys
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1
  def show
    @survey = Survey.find params[:id]
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # POST /surveys
  def create
    @survey = Survey.new(params[:survey].merge(:user => current_user))
    if @survey.save
      redirect_to surveys_url
    else
      render :action => :new
    end
  end

  # GET /surveys/1/edit
  def edit
    @survey = Survey.find params[:id]
  end

  # PUT /surveys/1/
  def update
    @survey = Survey.find params[:id]
    if @survey.update_attributes params[:survey]
      redirect_to surveys_url(@survey)
    else
      render :action => :edit
    end
  end

end
