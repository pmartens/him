class InvoiceMailer < ApplicationMailer
  def report_finance(invoice)
    @invoice = invoice

    @invoice.documents.each do |document|
      attachments[document.document_file_name] = File.read(document.document.path)
    end
    mail(to: 'pieter@cg.nl', subject: 'New Invoice reporting' )
  end

end
