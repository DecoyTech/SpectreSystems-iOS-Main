require 'rho/rhocontroller'
require 'helpers/browser_helper'

class SpectreUpdateController < Rho::RhoController
  include BrowserHelper

  # GET /SpectreUpdate
  def index
    @spectreupdates = SpectreUpdate.find(:all)
    render :back => '/app'
  end

  # GET /SpectreUpdate/{1}
  def show
    @spectreupdate = SpectreUpdate.find(@params['id'])
    if @spectreupdate
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /SpectreUpdate/new
  def new
    @spectreupdate = SpectreUpdate.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /SpectreUpdate/{1}/edit
  def edit
    @spectreupdate = SpectreUpdate.find(@params['id'])
    if @spectreupdate
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /SpectreUpdate/create
  def create
    @spectreupdate = SpectreUpdate.create(@params['spectreupdate'])
    redirect :action => :index
  end

  # POST /SpectreUpdate/{1}/update
  def update
    @spectreupdate = SpectreUpdate.find(@params['id'])
    @spectreupdate.update_attributes(@params['spectreupdate']) if @spectreupdate
    redirect :action => :index
  end

  # POST /SpectreUpdate/{1}/delete
  def delete
    @spectreupdate = SpectreUpdate.find(@params['id'])
    @spectreupdate.destroy if @spectreupdate
    redirect :action => :index  
  end
end
