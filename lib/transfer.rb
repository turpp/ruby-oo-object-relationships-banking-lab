class Transfer
  # your code here
attr_accessor :sender, :receiver, :status, :amount
  def initialize (sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end



  def valid?
    #checks to see if both account are open
    #checks account of the sender
    #checks account of reciever
    #if both are open - valid
    #if one closed - not valid
    #  binding.pry
    # sender_status = @sender.status
    # receiver_status = @receiver.status

    # if sender_status == receiver_status
    #   true 
    # else
    #   false
    # end

    #need call the valid method from the bank_account for both sender and reciever
  if @sender.valid? == @receiver.valid?
    true
  else
    false
  end
    


  end

  def reverse_transfer
    #takes the transfer_amount
    #reversed the execute_transaction to reciever sending to sender
    if @status == "complete"
    @receiver.deposit(-amount)
    @sender.deposit(amount)
    @status="reversed"
    end
  end


  def execute_transaction
      @execute_transaction ||= double_check
  end

  private
  def double_check
    
    
    if valid? && @sender.balance > amount
      #---------------------------------
      # the code is running more than once so the transaction happens more than once
      # I need to make sure that this code only runs once. either private method or one of the other weird ways
      #also need to run a second check to make sure that @sender balance is greater than @amount. 
      #transfer balance from sender to balance of reciever
# binding.pry
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status="complete"
    else 
      #reject
      @status="rejected"
      "Transaction rejected. Please check your account balance."
    end
  end


   
end
