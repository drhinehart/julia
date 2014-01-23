class VotesController < ApplicationController
  respond_to :html
  def index
    
  end
  
  def new
    if params[:id].blank?
      flash[:error]="Please select a lunch to vote for"
      redirect_to lunches_path
    else
      @lunch = Lunch.find(params[:id])
      @places = @lunch.places
      @users = User.all(:order=>'first_name,last_name')
      @user = User.find(session[:user_id]) if !session[:user_id].blank?
    end
  end
  
  def cast
    @lunch = Lunch.find(params[:id])
    place = Place.find(params[:place]) rescue nil
    user = current_user

    #TODO: This can probably be refactored out with some good validations.
    if !place.blank?
      flash[:error] = "You must pick a place"
      redirect_to new_vote_path(:id=>@lunch)
      return
    end
    
    if @lunch.has_user_voted?(user)
      flash[:error] = "You have already cast your vote. You cannot vote for another location"
    else 
      @lunch.lunch_places.each do |lp|
        if(place.id == lp.place.id)
          if user.voted_for?(lp)
            flash[:error]='You cannot vote for a restaurant more than once'
          else
            user.vote_for(lp)  
            flash[:success]='Thank you for voting. Enjoy Lunch!'
          end
          
        end
      end
    end

    if(flash[:error].blank?)
      redirect_to tally_path(@lunch)
    else
      redirect_to new_vote_path(@lunch)
    end

  end
  
  def tally
    @lunch = Lunch.find(params[:id])
    @users = User.all(:order=>'first_name,last_name')
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
