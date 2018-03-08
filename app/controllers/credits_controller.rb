class CreditsController < ApplicationController
  before_action :current_user_must_be_credit_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_credit_user
    credit = Credit.find(params[:id])

    unless current_user == credit.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @credits = Credit.all

    render("credits/index.html.erb")
  end

  def show
    @credit = Credit.find(params[:id])

    render("credits/show.html.erb")
  end

  def new
    @credit = Credit.new

    render("credits/new.html.erb")
  end

  def create
    @credit = Credit.new

    @credit.user_id = params[:user_id]
    @credit.amount = params[:amount]
    @credit.group_id = params[:group_id]
    @credit.pricing = params[:pricing]
    @credit.comments = params[:comments]
    @credit.weekly_payment = params[:weekly_payment]
    @credit.status = params[:status]
    @credit.disbursement_confirmation = params[:disbursement_confirmation]
    @credit.disbursement_confirmation_image = params[:disbursement_confirmation_image]
    @credit.disbursement_option_id = params[:disbursement_option_id]

    save_status = @credit.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/credits/new", "/create_credit"
        redirect_to("/credits")
      else
        redirect_back(:fallback_location => "/", :notice => "Credit created successfully.")
      end
    else
      render("credits/new.html.erb")
    end
  end

  def edit
    @credit = Credit.find(params[:id])

    render("credits/edit.html.erb")
  end

  def update
    @credit = Credit.find(params[:id])
    @credit.amount = params[:amount]
    @credit.group_id = params[:group_id]
    @credit.pricing = params[:pricing]
    @credit.comments = params[:comments]
    @credit.weekly_payment = params[:weekly_payment]
    @credit.status = params[:status]
    @credit.disbursement_confirmation = params[:disbursement_confirmation]
    @credit.disbursement_confirmation_image = params[:disbursement_confirmation_image]
    @credit.disbursement_option_id = params[:disbursement_option_id]

    save_status = @credit.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/credits/#{@credit.id}/edit", "/update_credit"
        redirect_to("/credits/#{@credit.id}", :notice => "Credit updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Credit updated successfully.")
      end
    else
      render("credits/edit.html.erb")
    end
  end

  def destroy
    @credit = Credit.find(params[:id])

    @credit.destroy

    if URI(request.referer).path == "/credits/#{@credit.id}"
      redirect_to("/", :notice => "Credit deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Credit deleted.")
    end
  end
end
