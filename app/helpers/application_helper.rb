module ApplicationHelper

  def nav_links
    if user_signed_in?
      render 'layouts/signedin'

    else
      render 'layouts/unsigned'
    end
  end
end
