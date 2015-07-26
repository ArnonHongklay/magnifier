# if Rails.env.staging? || Rails.env.production?
#   path = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s
# else
#   path = Rails.root.join('bin', 'wkhtmltopdf').to_s
# end

# WickedPdf.config = {
#   wkhtmltopdf: '/usr/local/bin/wkhtmltopdf',
#   layout: 'pdf',
#   exe_path: path
# }
