module ApplicationHelper
  def is_active?(user)
    if user.is_active == true
      "有効"
    else
      "退会"
    end
  end
end
