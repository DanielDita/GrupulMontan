module PinsHelper
  def display_likes(pin)
      votes = pin.votes_for.up.by_type(User)
      return list_likers(votes) if votes.size <= 4
      count_likers(votes)
    end
  def liked_pin(pin)
    return 'entypo-heart-fill' if current_user.voted_for? pin
    'entypo-heart-emtpy'
  end

  private
  def list_likers(votes)
      user_names = []
      unless votes.blank?
        votes.voters.each do |voter|
          user_names.push(link_to voter.user_name,

                                  class: 'user-name')
        end
        user_names.to_sentence.html_safe + like_plural(votes)
      end
    end

    def count_likers(votes)
      vote_count = votes.size
      vote_count.to_s + ' likes'
    end
  def like_plural(votes)
    return ' like this' if votes.count > 1
    ' likes this'
  end
end
