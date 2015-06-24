class DashboardController < ApplicationController

  #add_breadcrumb :index, :root_path

  def index
    @posts = News::Post.all
  end
end
