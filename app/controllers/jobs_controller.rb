class JobsController < ApplicationController
  before_action :ensure_job, only: [:new]
  before_action :current_job, only: [:show, :destroy]

  def index
    @jobs = Job.all
  end

  def new
  end

  def create
    Job.create(job_params)
    redirect_to jobs_path
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end

  def current_job
    @job = Job.find(params[:id])
  end

  def ensure_job
    @job = Job.new unless @job
  end
end
