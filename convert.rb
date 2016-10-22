require 'gollum-lib'
wiki = Gollum::Wiki.new("../trajectory.wiki")
wiki.pages.each do |p| 
	puts p.title
	filename = p.filename.gsub(/md$/, "html")

	text = <<-EOW--- 
layout: page
title: #{p.title}
author: #{p.last_version.author.name}
--- \n#{p.formatted_data}
EOW
	File.open(filename, 'w') { |file| file.write(text) }
	#puts p.formatted_data
end
