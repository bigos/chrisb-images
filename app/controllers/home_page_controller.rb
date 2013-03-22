class HomePageController < ApplicationController
  def index
    @big_photo = Editable.where(:name => "big_photo").first
    #logger.info @big_photo.inspect
    @featured_image = Editable.where(:name => "featured_image").first
    @posts = Post.find(:all, :order => "created_at DESC",:limit => 5)




  end
end
