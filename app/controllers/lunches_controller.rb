class LunchesController < ApplicationController
  respond_to :html

  def index
    @lunches = Lunch.all
    respond_with @lunches
  end

  def show
    @lunch = Lunch.find(params[:id])
    respond_with @lunch
  end

  def new
    @lunch = Lunch.new
    @places = Place.all(:order=>'title')
    offset = 0
    #figure out offset to Thursday if its not Thursday already. 
    #if past thursday, then use current time. 
    offset = offset  + (4 - Time.now.wday) if Time.now.wday < 4
    t = Time.now + offset.days
    @lunch.lunch_date = Time.mktime(t.year, t.month, t.day, 11,45,00,00)
    @lunch.vote_open = Time.mktime(t.year, t.month, t.day, 11,00,00,00)
    @lunch.vote_close = Time.mktime(t.year, t.month, t.day, 11,45,00,00)
    respond_with @lunch
  end

  def create
    @lunch = Lunch.new(params[:lunch])

    if !params[:lunch_places].blank?
      params[:lunch_places].each do |p|
        @lunch.places << Place.find(p)
      end
    end
    respond_to do |format|
      if @lunch.save
        flash[:success]= 'Lunch was successfully created.'
        format.html { redirect_to(lunches_path) }
      else
        @places = Place.all(:order=>'title')
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @lunch = Lunch.find(params[:id])

    respond_to do |format|
      if @lunch.update_attributes(params[:lunch])
        flash[:success] = 'Lunch was successfully updated.'
        format.html { redirect_to(@lunch) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @lunch = Lunch.find(params[:id])
    @lunch.destroy

    respond_to do |format|
      format.html { redirect_to(lunches_url) }
      format.xml  { head :ok }
    end
  end

end
