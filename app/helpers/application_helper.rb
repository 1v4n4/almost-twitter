module ApplicationHelper

  def signed_links
    if user_signed_in?
      render 'layouts/signedin'
    end
  end

  def signed_or_not
    if user_signed_in?
      render "layouts/form"
    else
      render 'layouts/unsigned'
    end
  end
end
