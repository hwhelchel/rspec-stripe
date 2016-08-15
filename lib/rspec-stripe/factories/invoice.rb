module RSpecStripe::Factory
  Invoice = Struct.new(:amount, :subscription) do
    def get
      @get ||= begin
        subscription.invoices.create(amount_due: amount)
      end
    end

    def cleanup
      get.closed = true
      get.save
    end
  end
end
