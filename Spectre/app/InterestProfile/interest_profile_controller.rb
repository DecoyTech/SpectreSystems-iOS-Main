require 'rho/rhocontroller'
require 'helpers/browser_helper'

class InterestProfileController < Rho::RhoController
  include BrowserHelper

  # GET /InterestProfile
  def index
    @interestprofiles = InterestProfile.find(:all)
    render :back => '/app'
  end

  # GET /InterestProfile/{1}
  def show
    @interestprofile = InterestProfile.find(@params['id'])
    if @interestprofile
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /InterestProfile/new
  def new
    @interestprofile = InterestProfile.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /InterestProfile/{1}/edit
  def edit
    @interestprofile = InterestProfile.find(@params['id'])
    if @interestprofile
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /InterestProfile/create
  def create
    @interestprofile = InterestProfile.create(@params['interestprofile'])
    redirect :action => :index
  end

  # POST /InterestProfile/{1}/update
  def update
    @interestprofile = InterestProfile.find(@params['id'])
    @interestprofile.update_attributes(@params['interestprofile']) if @interestprofile
    redirect :action => :index
  end

  # POST /InterestProfile/{1}/delete
  def delete
    @interestprofile = InterestProfile.find(@params['id'])
    @interestprofile.destroy if @interestprofile
    redirect :action => :index  
  end
end
