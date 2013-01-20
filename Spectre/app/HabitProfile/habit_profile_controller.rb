require 'rho/rhocontroller'
require 'helpers/browser_helper'

class HabitProfileController < Rho::RhoController
  include BrowserHelper

  # GET /HabitProfile
  def index
    @habitprofiles = HabitProfile.find(:all)
    render :back => '/app'
  end

  # GET /HabitProfile/{1}
  def show
    @habitprofile = HabitProfile.find(@params['id'])
    if @habitprofile
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /HabitProfile/new
  def new
    @habitprofile = HabitProfile.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /HabitProfile/{1}/edit
  def edit
    @habitprofile = HabitProfile.find(@params['id'])
    if @habitprofile
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /HabitProfile/create
  def create
    @habitprofile = HabitProfile.create(@params['habitprofile'])
    redirect :action => :index
  end

  # POST /HabitProfile/{1}/update
  def update
    @habitprofile = HabitProfile.find(@params['id'])
    @habitprofile.update_attributes(@params['habitprofile']) if @habitprofile
    redirect :action => :index
  end

  # POST /HabitProfile/{1}/delete
  def delete
    @habitprofile = HabitProfile.find(@params['id'])
    @habitprofile.destroy if @habitprofile
    redirect :action => :index  
  end
end
