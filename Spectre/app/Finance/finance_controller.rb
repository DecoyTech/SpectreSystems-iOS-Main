require 'rho/rhocontroller'
require 'helpers/browser_helper'

class FinanceController < Rho::RhoController
  include BrowserHelper

  # GET /Finance
  def index
    @finances = Finance.find(:all)
    render :back => '/app'
  end

  # GET /Finance/{1}
  def show
    @finance = Finance.find(@params['id'])
    if @finance
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Finance/new
  def new
    @finance = Finance.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Finance/{1}/edit
  def edit
    @finance = Finance.find(@params['id'])
    if @finance
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Finance/create
  def create
    @finance = Finance.create(@params['finance'])
    redirect :action => :index
  end

  # POST /Finance/{1}/update
  def update
    @finance = Finance.find(@params['id'])
    @finance.update_attributes(@params['finance']) if @finance
    redirect :action => :index
  end

  # POST /Finance/{1}/delete
  def delete
    @finance = Finance.find(@params['id'])
    @finance.destroy if @finance
    redirect :action => :index  
  end
end
