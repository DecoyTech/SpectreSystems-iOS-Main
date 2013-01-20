require 'rho/rhocontroller'
require 'helpers/browser_helper'

class TimeController < Rho::RhoController
  include BrowserHelper

  # GET /Time
  def index
    @times = Time.find(:all)
    render :back => '/app'
  end

  # GET /Time/{1}
  def show
    @time = Time.find(@params['id'])
    if @time
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Time/new
  def new
    @time = Time.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Time/{1}/edit
  def edit
    @time = Time.find(@params['id'])
    if @time
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Time/create
  def create
    @time = Time.create(@params['time'])
    redirect :action => :index
  end

  # POST /Time/{1}/update
  def update
    @time = Time.find(@params['id'])
    @time.update_attributes(@params['time']) if @time
    redirect :action => :index
  end

  # POST /Time/{1}/delete
  def delete
    @time = Time.find(@params['id'])
    @time.destroy if @time
    redirect :action => :index  
  end
end
