News::PostsController.class_eval do

  before_action :set_breadcrumb, only: [:show, :edit, :update, :destroy]

  def set_breadcrumb
    add_breadcrumb @post.title
  end

end