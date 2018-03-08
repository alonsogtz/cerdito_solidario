class CommunitiesController < ApplicationController
  def index
    @communities = Community.all

    render("communities/index.html.erb")
  end

  def show
    @community = Community.find(params[:id])

    render("communities/show.html.erb")
  end

  def new
    @community = Community.new

    render("communities/new.html.erb")
  end

  def create
    @community = Community.new

    @community.name = params[:name]
    @community.state_id = params[:state_id]

    save_status = @community.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/communities/new", "/create_community"
        redirect_to("/communities")
      else
        redirect_back(:fallback_location => "/", :notice => "Community created successfully.")
      end
    else
      render("communities/new.html.erb")
    end
  end

  def edit
    @community = Community.find(params[:id])

    render("communities/edit.html.erb")
  end

  def update
    @community = Community.find(params[:id])

    @community.name = params[:name]
    @community.state_id = params[:state_id]

    save_status = @community.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/communities/#{@community.id}/edit", "/update_community"
        redirect_to("/communities/#{@community.id}", :notice => "Community updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Community updated successfully.")
      end
    else
      render("communities/edit.html.erb")
    end
  end

  def destroy
    @community = Community.find(params[:id])

    @community.destroy

    if URI(request.referer).path == "/communities/#{@community.id}"
      redirect_to("/", :notice => "Community deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Community deleted.")
    end
  end
end
