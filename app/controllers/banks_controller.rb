class BanksController < ApplicationController
  def index
    @banks = Bank.all

    render("banks/index.html.erb")
  end

  def show
    @bank = Bank.find(params[:id])

    render("banks/show.html.erb")
  end

  def new
    @bank = Bank.new

    render("banks/new.html.erb")
  end

  def create
    @bank = Bank.new

    @bank.name = params[:name]

    save_status = @bank.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/banks/new", "/create_bank"
        redirect_to("/banks")
      else
        redirect_back(:fallback_location => "/", :notice => "Bank created successfully.")
      end
    else
      render("banks/new.html.erb")
    end
  end

  def edit
    @bank = Bank.find(params[:id])

    render("banks/edit.html.erb")
  end

  def update
    @bank = Bank.find(params[:id])

    @bank.name = params[:name]

    save_status = @bank.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/banks/#{@bank.id}/edit", "/update_bank"
        redirect_to("/banks/#{@bank.id}", :notice => "Bank updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bank updated successfully.")
      end
    else
      render("banks/edit.html.erb")
    end
  end

  def destroy
    @bank = Bank.find(params[:id])

    @bank.destroy

    if URI(request.referer).path == "/banks/#{@bank.id}"
      redirect_to("/", :notice => "Bank deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Bank deleted.")
    end
  end
end
