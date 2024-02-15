require "sinatra"
require "sinatra/reloader"

get("/") do
  "go to /sqaure/new"
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr = params.fetch("apr").to_f / 100
  @number_of_years = params.fetch("number_of_years").to_i
  @principal = params.fetch("principal").to_f

  @num_periods = @number_of_years*12

  r = @apr/12

  numerator = r * @principal
  denominator = 1 - (1 + r) ** -@num_periods
  
  @payment = numerator/denominator

  erb(:payment_results)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  erb(:random_results)
end
