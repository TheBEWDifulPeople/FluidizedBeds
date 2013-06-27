module CoursesHelper

	def convert_to_label(label_list)
		label_list.join("")
	end

	def applicable_course_to(credential)

		credential.present? ? '✓' : 'x' 
	end

end

 