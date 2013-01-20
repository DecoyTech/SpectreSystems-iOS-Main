require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ActionUseController < Rho::RhoController
  include BrowserHelper

  # GET /ActionUse
  def index
    @actionuses = ActionUse.find(:all)
    render :back => '/app'
  end

  # GET /ActionUse/{1}
  def show
    @actionuse = ActionUse.find(@params['id'])
    if @actionuse
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /ActionUse/new
  def new
    @actionuse = ActionUse.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /ActionUse/{1}/edit
  def edit
    @actionuse = ActionUse.find(@params['id'])
    if @actionuse
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /ActionUse/create
  def create
    @actionuse = ActionUse.create(@params['actionuse'])
    redirect :action => :index
  end

  # POST /ActionUse/{1}/update
  def update
    @actionuse = ActionUse.find(@params['id'])
    @actionuse.update_attributes(@params['actionuse']) if @actionuse
    redirect :action => :index
  end

  # POST /ActionUse/{1}/delete
  def delete
    @actionuse = ActionUse.find(@params['id'])
    @actionuse.destroy if @actionuse
    redirect :action => :index  
  end
end
