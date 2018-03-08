class PaymentConfirmationsController < ApplicationController
  def index
    @q = PaymentConfirmation.ransack(params[:q])
    @payment_confirmations = @q.result(:distinct => true).includes(:group, :payment_method).page(params[:page]).per(10)

    render("payment_confirmations/index.html.erb")
  end

  def show
    @payment_confirmation = PaymentConfirmation.find(params[:id])

    render("payment_confirmations/show.html.erb")
  end

  def new
    @payment_confirmation = PaymentConfirmation.new

    render("payment_confirmations/new.html.erb")
  end

  def create
    @payment_confirmation = PaymentConfirmation.new

    @payment_confirmation.group_id = params[:group_id]
    @payment_confirmation.date_posted = params[:date_posted]
    @payment_confirmation.image = params[:image]
    @payment_confirmation.payment_method_id = params[:payment_method_id]

    save_status = @payment_confirmation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/payment_confirmations/new", "/create_payment_confirmation"
        redirect_to("/payment_confirmations")
      else
        redirect_back(:fallback_location => "/", :notice => "Payment confirmation created successfully.")
      end
    else
      render("payment_confirmations/new.html.erb")
    end
  end

  def edit
    @payment_confirmation = PaymentConfirmation.find(params[:id])

    render("payment_confirmations/edit.html.erb")
  end

  def update
    @payment_confirmation = PaymentConfirmation.find(params[:id])

    @payment_confirmation.group_id = params[:group_id]
    @payment_confirmation.date_posted = params[:date_posted]
    @payment_confirmation.image = params[:image]
    @payment_confirmation.payment_method_id = params[:payment_method_id]

    save_status = @payment_confirmation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/payment_confirmations/#{@payment_confirmation.id}/edit", "/update_payment_confirmation"
        redirect_to("/payment_confirmations/#{@payment_confirmation.id}", :notice => "Payment confirmation updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Payment confirmation updated successfully.")
      end
    else
      render("payment_confirmations/edit.html.erb")
    end
  end

  def destroy
    @payment_confirmation = PaymentConfirmation.find(params[:id])

    @payment_confirmation.destroy

    if URI(request.referer).path == "/payment_confirmations/#{@payment_confirmation.id}"
      redirect_to("/", :notice => "Payment confirmation deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Payment confirmation deleted.")
    end
  end
end
