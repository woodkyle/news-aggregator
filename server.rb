require "sinatra"
require "csv"

get "/articles" do
  @texts = CSV.read("articles.csv")
  erb :articles
end

post "/articles" do

  full_article = []
  full_article << params["title"]
  full_article << params["description"]
  full_article <<  params["url"]

  CSV.open("articles.csv", "a") { |csv| csv << full_article }

  redirect "/articles"

end

get "/articles/new" do
  erb :new
end
