class ProfilesController < ApplicationController
  before_filter :authenticate_person!
  layout 'people'

  def index
    @profiles = Profile.includes(:person).order("RANDOM()")
  end

  def edit
    @profile = Profile.first_or_create(person_id: current_person.id)
  end

  def update
    @profile = current_person.profile
    if @profile.update_attributes(profile_params)
      redirect_to edit_profile_path, notice: 'Profile successfully updated'
    else
      render :edit
    end
  end
  
  protected
  def profile_params
    params.require(:profile).permit(:title, :description, :bio, :twitter, :github)
  end
end
