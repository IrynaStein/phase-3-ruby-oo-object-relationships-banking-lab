class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.status == 'pending' && sender.balance > @amount && self.valid?
      receiver.balance += self.amount
      sender.balance -= self.amount
      self.status = 'complete'
    else 
      self.status= "rejected"
      'Transaction rejected. Please check your account balance.'
    end
  end

  def reverse_transfer
    if self.valid? && self.status == 'complete'
       self.status = "reversed"
       receiver.balance -= self.amount
       sender.balance += self.amount
    end
  end
end
