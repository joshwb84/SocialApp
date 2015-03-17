module ApplicationHelper
	def site_name
    # Change the value below between the quotes to be the websites name.
    "Konverge @ Kellogg"
  end

  def site_url
    if Rails.env.production?
      # Place your production URL in the quotes below
      root_path
    else
      # Our dev & test URL
      "http://localhost:3000"
    end
  end

  def meta_author
    # Change the value below between the quotes.
    "Joshua Borin"
  end

  def meta_description
    # Change the value below between the quotes.
    "Website for students to meetup"
  end

  def meta_keywords
    # Change the value below between the quotes.
    "Add your keywords here"
  end

  # Returns the full title on a per-page basis.
  # No need to change any of this we set page_title and site_name elsewhere.
  def full_title(page_title)
    if page_title.empty?
      site_name
    else
      "#{page_title} | #{site_name}"
    end
  end

def sortable(column, title=nil)
  title ||= column.titleize
  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  link_to title, :sort => column, :direction => direction
end

end
