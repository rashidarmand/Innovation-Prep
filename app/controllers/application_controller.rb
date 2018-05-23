#  caches_page :index, :show  
#  skip_before_filter :verify_authenticity_token, :only => [:index, :show]

class ApplicationController < ActionController::Base

  include Clearance::Controller

  # def set_courses
  #   @courses = Course.all
  # end

end
