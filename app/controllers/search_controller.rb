class SearchController < ApplicationController

  def search
    if params[:search].nil?
      @invoices = []
      @devices = []
    else
      params[:search][:models].each do |model|
        case model.to_sym
          when :invoices
            @invoices = Invoice.search params[:search][:q]
          when :devices
            @devices = Device.search params[:search][:q]
        end
      end
    end
  end

end
