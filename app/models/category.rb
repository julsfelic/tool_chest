class Category < ActiveRecord::Base
  has_many :tools

  def user_tools(user_id)
    tools.where(user_id: user_id)
  end
end
