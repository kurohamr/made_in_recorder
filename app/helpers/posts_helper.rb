module PostsHelper
  def choose_new_or_edit
    if action_name == 'new'
     posts_path
    elsif action_name == 'edit'
     post_path
    end
  end

  def render_with_hashtags(description)
    description.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/posts/hashtag/#{word.delete('#')}"}.html_safe
  end
end
