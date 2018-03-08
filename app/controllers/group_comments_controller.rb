class GroupCommentsController < ApplicationController
  before_action :current_user_must_be_group_comment_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_group_comment_user
    group_comment = GroupComment.find(params[:id])

    unless current_user == group_comment.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = GroupComment.ransack(params[:q])
    @group_comments = @q.result(:distinct => true).includes(:user, :group).page(params[:page]).per(10)

    render("group_comments/index.html.erb")
  end

  def show
    @group_comment = GroupComment.find(params[:id])

    render("group_comments/show.html.erb")
  end

  def new
    @group_comment = GroupComment.new

    render("group_comments/new.html.erb")
  end

  def create
    @group_comment = GroupComment.new

    @group_comment.user_id = params[:user_id]
    @group_comment.group_id = params[:group_id]
    @group_comment.body = params[:body]

    save_status = @group_comment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/group_comments/new", "/create_group_comment"
        redirect_to("/group_comments")
      else
        redirect_back(:fallback_location => "/", :notice => "Group comment created successfully.")
      end
    else
      render("group_comments/new.html.erb")
    end
  end

  def edit
    @group_comment = GroupComment.find(params[:id])

    render("group_comments/edit.html.erb")
  end

  def update
    @group_comment = GroupComment.find(params[:id])
    @group_comment.group_id = params[:group_id]
    @group_comment.body = params[:body]

    save_status = @group_comment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/group_comments/#{@group_comment.id}/edit", "/update_group_comment"
        redirect_to("/group_comments/#{@group_comment.id}", :notice => "Group comment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Group comment updated successfully.")
      end
    else
      render("group_comments/edit.html.erb")
    end
  end

  def destroy
    @group_comment = GroupComment.find(params[:id])

    @group_comment.destroy

    if URI(request.referer).path == "/group_comments/#{@group_comment.id}"
      redirect_to("/", :notice => "Group comment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Group comment deleted.")
    end
  end
end
