class PdfController < ApplicationController
  def index
    @text = params[:text] || 'বাম  চোখ'
  end

  def prawn
    pdf = PdfGenerator::Prawn.new(params[:text])
    send_data pdf.render, filename: 'test.pdf', type: 'application/pdf', disposition: 'inline'
  end

  def wicked
    pdf = PdfGenerator::Wicked.new(params[:text])
    send_data pdf.render, filename: 'test.pdf', type: 'application/pdf', disposition: 'inline'
  end
end
