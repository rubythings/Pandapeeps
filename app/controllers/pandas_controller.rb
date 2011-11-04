class PandasController < ApplicationController
  def index
    @pandas = Panda.all
  end

  def show
    @panda = Panda.find(params[:id])
  end

  def new
    @panda = Panda.new
  end

  def create
    @panda = Panda.new(params[:panda])
    if @panda.save
      redirect_to @panda, :notice => "Successfully created panda."
    else
      render :action => 'new'
    end
  end

  def edit
    @panda = Panda.find(params[:id])
  end

  def update
    @panda = Panda.find(params[:id])
    if @panda.update_attributes(params[:panda])
      redirect_to @panda, :notice  => "Successfully updated panda."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @panda = Panda.find(params[:id])
    @panda.destroy
    redirect_to pandas_url, :notice => "Successfully destroyed panda."
  end
end
