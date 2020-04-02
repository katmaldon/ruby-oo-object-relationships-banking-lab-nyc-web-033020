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
    elsif !@sender.valid?
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



    #  @sender.balance -= @amount
    #  @receiver.balance += @amount
    #  @status = "complete"
    # end




  end

end
