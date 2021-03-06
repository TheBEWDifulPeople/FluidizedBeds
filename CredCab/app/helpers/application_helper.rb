module ApplicationHelper

# Returns the full title on a per-page basis.       # Documentation comment
  def full_title(page_title)                          # Method definition
    base_title = "Credential Cabinet"  					  # Variable assignment
    if page_title.empty?                              # Boolean test
      base_title                                      # Implicit return
    else
      "#{base_title} | #{page_title}"                 # String interpolation
    end
  end	

end


	def image_boolean(image)
			image.present? ? '✓' : 'x' 
	end

