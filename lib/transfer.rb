class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction

    if @status == "complete"
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @sender.valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif !@receiver.valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end

    def reverse_transfer
      if @status == "complete"
        @sender.deposit(@amount)
        @receiver.deposit(@amount * -1)
        @status = "reversed"
      end
    end


  end

end
