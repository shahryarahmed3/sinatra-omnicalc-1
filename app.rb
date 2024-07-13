require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square/result") do
  @number = params.fetch('number').to_f

  @num_squared = @number ** 2


  erb(:square_result)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/result") do 
  @number = params.fetch('user_number').to_f
  @num_root = Math.sqrt(@number)

  erb(:square_root_result)
end

get("/payment/new") do 
  erb(:payment)
end

get("/payment/results") do
  @r = params.fetch('user_apr').to_f 
  @n = params.fetch('user_years').to_i
  @pv = params.fetch('user_pv').to_f

  rate = @r / 100.0 / 12.0
  number_of_payments = @n * 12
  @monthly_payment = (rate * @pv) / (1 - ((1 + rate) ** (-number_of_payments)))

  @r = @r.to_fs(:percentage, {:precision => 4})
  @monthly_payment = @monthly_payment.to_fs(:currency)
  @pv = @pv.to_fs(:currency)

  erb(:payment_result)
end

get("/random/new") do 
  erb(:random)
end

get("/random/results") do 
  @min = params.fetch('user_min').to_f
  @max = params.fetch('user_max').to_f

  @random_num = rand(@min..@max)

  erb(:random_result)
end
