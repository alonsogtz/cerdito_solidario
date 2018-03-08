class LeadersController < ApplicationController
  before_action :current_user_must_be_leader_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_leader_user
    leader = Leader.find(params[:id])

    unless current_user == leader.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @leaders = Leader.all

    render("leaders/index.html.erb")
  end

  def show
    @leader = Leader.find(params[:id])

    render("leaders/show.html.erb")
  end

  def new
    @leader = Leader.new

    render("leaders/new.html.erb")
  end

  def create
    @leader = Leader.new

    @leader.user_id = params[:user_id]
    @leader.group_id = params[:group_id]

    save_status = @leader.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/leaders/new", "/create_leader"
        redirect_to("/leaders")
      else
        redirect_back(:fallback_location => "/", :notice => "Leader created successfully.")
      end
    else
      render("leaders/new.html.erb")
    end
  end

  def edit
    @leader = Leader.find(params[:id])

    render("leaders/edit.html.erb")
  end

  def update
    @leader = Leader.find(params[:id])
    @leader.group_id = params[:group_id]

    save_status = @leader.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/leaders/#{@leader.id}/edit", "/update_leader"
        redirect_to("/leaders/#{@leader.id}", :notice => "Leader updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Leader updated successfully.")
      end
    else
      render("leaders/edit.html.erb")
    end
  end

  def destroy
    @leader = Leader.find(params[:id])

    @leader.destroy

    if URI(request.referer).path == "/leaders/#{@leader.id}"
      redirect_to("/", :notice => "Leader deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Leader deleted.")
    end
  end
end
