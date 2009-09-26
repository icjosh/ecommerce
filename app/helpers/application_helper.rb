# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(content)
    content_for(:title, content)
  end

  def head(&content)
    content_for(:head, content)
  end

end
