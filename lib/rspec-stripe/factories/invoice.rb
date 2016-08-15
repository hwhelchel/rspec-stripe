module RSpecStripe::Factory
  Invoice = Struct.new(:customer) do
    def get
      @get ||= begin
        Stripe::Invoice.list(customer: customer.id).first
      end
    end

    def cleanup
      get.closed = true
      get.save
    end
  end
end
