require 'caffeinate'
Given('Maria orders ${float} of coffee from Li') do |float|
    @maria = Customer.new #@ symbole creates instance variable
    @li = Associate.new
    @price = float
    @card_minimum = 2.0
    @maria.orders
end
  
When('Maria pays with a credit card') do
    @maria.pays_with_credit
end

Then("Li should process the payment") do
    expect(@li.process_payment(@price, @card_minimum)).to include(true)
end

Then('Li should not process the payment') do
    expect(@li.process_payment(@price, @card_minimum)).to include(false)
end

