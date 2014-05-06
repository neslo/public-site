class ProjectsController < ApplicationController
  before_filter :authenticate_person!, only: [:tap_on, :tap_off]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.friendly.find(params[:title])
  end

  def tap_on
    @project = Project.friendly.find(params[:project_title])
    @role = ProjectRole.find(params[:role])
    if @role.tap_on(current_person)
      redirect_to @project, notice: 'Welcome to the project!'
    else
      redirect_to @project, alert: 'We cannot tap you onto this project.'
    end
  end

  def tap_off
    @project = Project.friendly.find(params[:project_title])
    @role = ProjectRole.find(params[:role])
    if @role.tap_off(current_person)
      redirect_to @project, notice: 'Thanks for your contribution, we are sad to see you go!'
    else
      redirect_to @project, alert: 'We cannot tap you off from this project.'
    end
  end
end
