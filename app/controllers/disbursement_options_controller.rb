class DisbursementOptionsController < ApplicationController
  before_action :current_user_must_be_disbursement_option_beneficiary, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_disbursement_option_beneficiary
    disbursement_option = DisbursementOption.find(params[:id])

    unless current_user == disbursement_option.beneficiary
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = DisbursementOption.ransack(params[:q])
    @disbursement_options = @q.result(:distinct => true).includes(:beneficiary, :bank, :credits).page(params[:page]).per(10)

    render("disbursement_options/index.html.erb")
  end

  def show
    @credit = Credit.new
    @disbursement_option = DisbursementOption.find(params[:id])

    render("disbursement_options/show.html.erb")
  end

  def new
    @disbursement_option = DisbursementOption.new

    render("disbursement_options/new.html.erb")
  end

  def create
    @disbursement_option = DisbursementOption.new

    @disbursement_option.bank_id = params[:bank_id]
    @disbursement_option.account_number = params[:account_number]
    @disbursement_option.beneficiary_id = params[:beneficiary_id]

    save_status = @disbursement_option.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/disbursement_options/new", "/create_disbursement_option"
        redirect_to("/disbursement_options")
      else
        redirect_back(:fallback_location => "/", :notice => "Disbursement option created successfully.")
      end
    else
      render("disbursement_options/new.html.erb")
    end
  end

  def edit
    @disbursement_option = DisbursementOption.find(params[:id])

    render("disbursement_options/edit.html.erb")
  end

  def update
    @disbursement_option = DisbursementOption.find(params[:id])

    @disbursement_option.bank_id = params[:bank_id]
    @disbursement_option.account_number = params[:account_number]
    @disbursement_option.beneficiary_id = params[:beneficiary_id]

    save_status = @disbursement_option.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/disbursement_options/#{@disbursement_option.id}/edit", "/update_disbursement_option"
        redirect_to("/disbursement_options/#{@disbursement_option.id}", :notice => "Disbursement option updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Disbursement option updated successfully.")
      end
    else
      render("disbursement_options/edit.html.erb")
    end
  end

  def destroy
    @disbursement_option = DisbursementOption.find(params[:id])

    @disbursement_option.destroy

    if URI(request.referer).path == "/disbursement_options/#{@disbursement_option.id}"
      redirect_to("/", :notice => "Disbursement option deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Disbursement option deleted.")
    end
  end
end
