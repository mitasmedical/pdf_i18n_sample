class PdfGenerator
  class Wicked
    attr_reader :pdf, :text

    def initialize(text)
      @pdf = WickedPdf.new
      @text = text
    end

    def render
      pdf_html = ActionController::Base.new.render_to_string(template: 'pdf/wicked', layout: 'pdf', locals: { text: text })
      ::WickedPdf.new.pdf_from_string(pdf_html)
    end
  end
end
