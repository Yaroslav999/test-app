class CashManagementDecorator
  def initialize(cash_management)
    @cash_management = cash_management
  end

  def method_missing(method, *args, &block)
    value = @cash_management.public_send(method, *args, &block)

    if method.to_s.include?('cash')
      "$#{'%.2f' % value}"
    else
      value
    end
  end

  def respond_to_missing?(method, include_private = false)
    @cash_management.respond_to?(method) || super
  end
end
