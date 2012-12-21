class DownloadsController < ApplicationController
  before_filter :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @downloads = Download.all
  end

  def show
    @download = Download.find(params[:id])
    send_file "public/downloads/#{@download.filepath}"
  end

  def new
    @download = Download.new
  end

  def create
    @download = Download.new(params[:download])
    if @download.save
      flash[:success] = "Download item created."
      redirect_to downloads_path
    else
      render 'new'
    end
  end

  def edit
    @download = Download.find(params[:id])
  end

  def update
    @download = Download.find(params[:id])
    if @download.update_attributes(params[:download])
      flash[:success] = "Download updated"
      redirect_to downloads_path
    else
      render 'edit'
    end
  end

  def destroy
    Download.find(params[:id]).destroy
    flash[:success] = "Download destroyed."
    redirect_to downloads_path
  end

  private
    def admin_user
      redirect_to(signin_path) unless signed_in? && current_user.admin?
    end

end
