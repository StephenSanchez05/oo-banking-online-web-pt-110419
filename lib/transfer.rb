class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
   sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if @status == "pending" && valid?
      @sender.deposit(-amount)
      @reciever.deposit(amount)
      @status = "complete"
    elsif vaild? == false
      puts "Transaction rejected. Please check your account balance."
      @status = "rejected"
    end
  end
      
  
end
