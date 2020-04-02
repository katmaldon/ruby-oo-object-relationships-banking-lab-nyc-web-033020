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
      "Transaction rejected"
    elsif @sender.balance < @amount
      "Transaction rejected."
    elsif !@sender.valid?
      "Transaction rejected."
    elsif !@receiver.valid?
      "Transaction rejected."
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
