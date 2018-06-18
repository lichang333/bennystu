require_relative "../controllers/posts_controller.rb"

class PostsView
  # TODO: implement methods called by the PostsController
  def show_output(array_of_posts)
    array_of_posts.each do |post|
      puts "#{post.id}. #{post.title}\nURL: #{post.url}\nvotes: #{post.votes}"
      puts "-----------"
    end
  end

  def new_post
    post_inputs = ["title", "url", "votes"]
    post_hash = {}
    post_inputs.each do |key|
      puts "Please enter the new post's #{key}"
      key_value = gets.chomp
      key_value.to_i if key == "votes"
      post_hash[key.to_sym] = key_value
    end
    post_hash
  end

  def change_post(change)

    post_hash = {}
    puts "which post would you like to #{change}?"
    puts "--------------"
    $controller.index
    post_id = gets.chomp.to_i
    post_hash[:id] = post_id
    post_hash
  end

  def update_post
    post_hash = change_post("update")
    post_inputs = ["title", "url", "votes"]
    puts "Which field do you want to update?"
    post_inputs.each_with_index do |key, i|
      puts "#{i+1}. #{key}"
    end

    input_value = post_inputs[gets.chomp.to_i - 1]
    puts "Please enter the new #{input_value}"
    key_value = gets.chomp
    key_value.to_i if input_value == "votes"
    post_hash[input_value.to_sym] = key_value
    post_hash
  end

  def delete_post
    change_post("delete")
  end
end
