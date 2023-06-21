class PdfGenerator
  class Prawn
    attr_reader :pdf
    delegate :render, to: :pdf

    def initialize(text)
      @pdf = ::Prawn::Document.new
      pdf.font('/usr/local/share/fonts/Kalpurush/Kalpurush-Regular.ttf') do
        pdf.text text
      end
    end
  end
end
