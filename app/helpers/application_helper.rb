module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def logged_in_user
    return render 'layouts/visitor' unless current_user

    render 'layouts/loggedin_user'
  end

  def notices_alerts
    render 'layouts/notices' if notice.present?
    render 'layouts/alerts' if alert.present?
  end

  def invite_btn(user)
    bonds = Bond.where(friend: current_user, user: user, confirmed: false)
    friend = bonds.map{ |bond| bond.user }
    return if friend.include?(user) || current_user == user

    button_to('Invite to Friendship', invite_path(friend_id: user.id), method: :post)
  end
end
