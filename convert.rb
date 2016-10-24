require 'gollum-lib'
wiki = Gollum::Wiki.new("../trajectory.wiki", :base_path => "/trajectory")
wiki.pages.each do |p| 
	puts p.title
	filename = p.filename.gsub(/md$/, "html")
	#filename = p.filename

	if p.title == "Home"
		layout = "index"
		filename = "index.html"
	else
		layout = "page"
	end	

	text = "--- 
layout: #{layout}
title: #{p.title}
author: #{p.last_version.author.name}
--- \n#{p.formatted_data}"

	File.open(filename, 'w') { |file| file.write(text) }
	puts p
end
