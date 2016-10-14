require 'gollum-lib'
wiki = Gollum::Wiki.new("../trajectory.wiki")
wiki.pages.each do |p| 
	puts p.title
	filename = p.filename.gsub(/md$/, "html")

	text = "--- \nlayout: page\ntitle: #{p.title}\n--- \n#{p.formatted_data}"
	File.open(filename, 'w') { |file| file.write(text) }
	#puts p.formatted_data
end
