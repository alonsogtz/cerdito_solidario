class PersonalMessagesController < ApplicationController
  def index
    @personal_messages = PersonalMessage.all

    render("personal_messages/index.html.erb")
  end

  def show
    @personal_message = PersonalMessage.find(params[:id])

    render("personal_messages/show.html.erb")
  end

  def new
    @personal_message = PersonalMessage.new

    render("personal_messages/new.html.erb")
  end

  def create
    @personal_message = PersonalMessage.new

    @personal_message.sender_id = params[:sender_id]
    @personal_message.receiver_id = params[:receiver_id]
    @personal_message.message = params[:message]

    save_status = @personal_message.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/personal_messages/new", "/create_personal_message"
        redirect_to("/personal_messages")
      else
        redirect_back(:fallback_location => "/", :notice => "Personal message created successfully.")
      end
    else
      render("personal_messages/new.html.erb")
    end
  end

  def edit
    @personal_message = PersonalMessage.find(params[:id])

    render("personal_messages/edit.html.erb")
  end

  def update
    @personal_message = PersonalMessage.find(params[:id])

    @personal_message.sender_id = params[:sender_id]
    @personal_message.receiver_id = params[:receiver_id]
    @personal_message.message = params[:message]

    save_status = @personal_message.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/personal_messages/#{@personal_message.id}/edit", "/update_personal_message"
        redirect_to("/personal_messages/#{@personal_message.id}", :notice => "Personal message updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Personal message updated successfully.")
      end
    else
      render("personal_messages/edit.html.erb")
    end
  end

  def destroy
    @personal_message = PersonalMessage.find(params[:id])

    @personal_message.destroy

    if URI(request.referer).path == "/personal_messages/#{@personal_message.id}"
      redirect_to("/", :notice => "Personal message deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Personal message deleted.")
    end
  end
end
