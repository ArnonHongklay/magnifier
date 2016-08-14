module ReportHelper
  # def wicked_pdf_stylesheet_link_tag(*sources)
  #   sources.collect { |source|
  #     asset = Rails.application.assets.find_asset("#{source}.css")
  #
  #     if asset.nil?
  #       raise "could not find asset for #{source}.css"
  #     else
  #       "<style type='text/css'>#{asset.body}</style>"
  #     end
  #   }.join("\n").gsub(/url\(['"](.+)['"]\)(.+)/,%[url("#{wicked_pdf_image_location("\\1")}")\\2]).html_safe
  # end
  #
  # def wicked_pdf_image_tag(img, options={})
  #   if img[0] == "/"
  #     new_image = img.slice(1..-1)
  #     image_tag "file://#{Rails.root.join('public', new_image)}", options
  #   else
  #     image_tag "file://#{Rails.root.join('public', 'images', img)}", options
  #   end
  # end
end
