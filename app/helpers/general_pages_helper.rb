module GeneralPagesHelper
  def format_title(title = "")
    base_title = "ToDo Application"
    if(title.empty?)
      base_title
    else
      "#{title} | #{base_title}"
    end
  end
end
