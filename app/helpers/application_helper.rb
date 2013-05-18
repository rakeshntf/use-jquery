module ApplicationHelper
	def picture(total_picture_size)
		$a= 0
		total_picture_size.each do |z|
			$a +=z.file.size
		end
	$a 
	end
	
end
