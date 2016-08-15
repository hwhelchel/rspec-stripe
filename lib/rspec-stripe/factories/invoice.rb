module RSpecStripe::Factory
  Invoice = Struct.new(:customer) do
    def get
      @get ||= begin
        Stripe::Invoice.list(customer: customer.id).first
      end
    end

    def cleanup
      # no-op
    end
  end
end
