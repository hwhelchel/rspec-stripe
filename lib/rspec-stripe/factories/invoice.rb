module RSpecStripe::Factory
  Invoice = Struct.new(:amount, :customer) do
    def get
      @get ||= begin
        Stripe::Invoice.create(customer: customer.id, amount_due: amount)
      end
    end

    def cleanup
      get.closed = true
      get.save
    end
  end
end
