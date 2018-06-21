module ApplicationHelper

  # Returns title each page
  def full_title(page_title = '')
    base_title = "Styled"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end