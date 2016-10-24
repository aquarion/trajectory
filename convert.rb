require 'gollum-lib'
wiki = Gollum::Wiki.new("../trajectory.wiki")
wiki.pages.each do |p| 
	puts p.title
	filename = p.filename.gsub(/md$/, "html")

	if p.title == "Home"
		layout = "index"
		filename = "index.html"
	else
		layout = "page"
	end	

	text = <<-EOW--- 
layout: #{layout}
title: #{p.title}
author: #{p.last_version.author.name}
--- \n#{p.formatted_data}
EOW
	File.open(filename, 'w') { |file| file.write(text) }
	#puts p.formatted_data
end
