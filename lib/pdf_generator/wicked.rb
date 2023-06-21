class PdfGenerator
  class Wicked
    attr_reader :pdf, :text

    def initialize(text)
      @pdf = WickedPdf.new
      @text = text
    end

    def render
      pdf.pdf_from_string("<p>#{text}</p>")
    end
  end
end
