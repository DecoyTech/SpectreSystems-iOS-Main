require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ShoeBoxController < Rho::RhoController
  include BrowserHelper

  # GET /ShoeBox
  def index
    @shoeboxes = ShoeBox.find(:all)
    render :back => '/app'
  end

  # GET /ShoeBox/{1}
  def show
    @shoebox = ShoeBox.find(@params['id'])
    if @shoebox
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /ShoeBox/new
  def new
    @shoebox = ShoeBox.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /ShoeBox/{1}/edit
  def edit
    @shoebox = ShoeBox.find(@params['id'])
    if @shoebox
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /ShoeBox/create
  def create
    @shoebox = ShoeBox.create(@params['shoebox'])
    redirect :action => :index
  end

  # POST /ShoeBox/{1}/update
  def update
    @shoebox = ShoeBox.find(@params['id'])
    @shoebox.update_attributes(@params['shoebox']) if @shoebox
    redirect :action => :index
  end

  # POST /ShoeBox/{1}/delete
  def delete
    @shoebox = ShoeBox.find(@params['id'])
    @shoebox.destroy if @shoebox
    redirect :action => :index  
  end
end
