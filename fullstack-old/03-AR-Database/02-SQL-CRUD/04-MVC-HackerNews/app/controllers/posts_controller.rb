require_relative "../models/post.rb"
require_relative "../views/posts_view.rb"

class PostsController
  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST NOT use the global variable DB in this file #
  ################################################################

  def index
    # TODO: implement listing all posts
    all_posts = Post.all
    @view.show_output(all_posts)
  end

  def create
    # TODO: implement creating a new post
    post_parameters = @view.new_post
    Post.new(post_parameters).save
  end

  def update
    # TODO: implement updating an existing post
    post_parameters = @view.update_post
    Post.new(post_parameters).save
  end

  def destroy
    # TODO: implement destroying a post
    post_parameters = @view.delete_post
    Post.new(post_parameters).destroy
  end

  def upvote
    # TODO: implement upvoting a post
    post_parameters = @view.change_post("upvote")
    all_posts = Post.all
    all_posts.each do |post|
      upvote = post.votes + 1
      post_parameters[:votes] = upvote if post.id == post_parameters[:id]
    end
   Post.new(post_parameters).save
  end
end
