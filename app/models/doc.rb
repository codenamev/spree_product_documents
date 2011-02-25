class Doc < Asset
  has_attached_file :attachment,
                    :url => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  before_post_process :skip_thumbnail_creation
  
  ALLOWED_CONTENT_TYPES = [ "application/msword","application/vnd.ms-excel","application/pdf" ]
  ALLOWED_FILE_EXTENSIONS = [ "pdf", "doc", "docx", "xls", "xlsx" ]

  def validate
    unless attachment.errors.empty?
      # uncomment this to get rid of the less-than-useful interrim messages
      # errors.clear 
      errors.add :attachment, "Paperclip returned errors for file '#{attachment_file_name}' - check document source file."
      false
    end
  end

  private
  def skip_thumbnail_creation
    return false if (attachment_content_type =~ /application\/.*pdf/ or ALLOWED_CONTENT_TYPES.include?(attachment_content_type))
  end
end
