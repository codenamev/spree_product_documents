module Admin::DocsHelper
  def get_doc_icon(doc)
    word_icon = 'word_icon.png'
    excel_icon = 'excel_icon.png'
    pdf_icon = 'pdf_icon.png'
    file_extension = doc.attachment.url.split(".")[-1].downcase
    if file_extension.include?('pdf')
      return pdf_icon
    elsif file_extension.include?('docx')
      return word_icon
    else
      return excel_icon
    end
  end
end
