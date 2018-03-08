class AdditionalInfosController < ApplicationController
  before_action :current_user_must_be_additional_info_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_additional_info_user
    additional_info = AdditionalInfo.find(params[:id])

    unless current_user == additional_info.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @additional_infos = current_user.additional_infos.page(params[:page]).per(10)

    render("additional_infos/index.html.erb")
  end

  def show
    @additional_info = AdditionalInfo.find(params[:id])

    render("additional_infos/show.html.erb")
  end

  def new
    @additional_info = AdditionalInfo.new

    render("additional_infos/new.html.erb")
  end

  def create
    @additional_info = AdditionalInfo.new

    @additional_info.description = params[:description]
    @additional_info.image = params[:image]
    @additional_info.user_id = params[:user_id]
    @additional_info.title = params[:title]

    save_status = @additional_info.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/additional_infos/new", "/create_additional_info"
        redirect_to("/additional_infos")
      else
        redirect_back(:fallback_location => "/", :notice => "Additional info created successfully.")
      end
    else
      render("additional_infos/new.html.erb")
    end
  end

  def edit
    @additional_info = AdditionalInfo.find(params[:id])

    render("additional_infos/edit.html.erb")
  end

  def update
    @additional_info = AdditionalInfo.find(params[:id])

    @additional_info.description = params[:description]
    @additional_info.image = params[:image]
    @additional_info.user_id = params[:user_id]
    @additional_info.title = params[:title]

    save_status = @additional_info.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/additional_infos/#{@additional_info.id}/edit", "/update_additional_info"
        redirect_to("/additional_infos/#{@additional_info.id}", :notice => "Additional info updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Additional info updated successfully.")
      end
    else
      render("additional_infos/edit.html.erb")
    end
  end

  def destroy
    @additional_info = AdditionalInfo.find(params[:id])

    @additional_info.destroy

    if URI(request.referer).path == "/additional_infos/#{@additional_info.id}"
      redirect_to("/", :notice => "Additional info deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Additional info deleted.")
    end
  end
end
