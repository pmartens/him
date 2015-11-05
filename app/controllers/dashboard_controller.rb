class DashboardController < ApplicationController

  add_breadcrumb :index, :root_path, only: :index

  def index
    @posts = News::Post.all
  end

end
