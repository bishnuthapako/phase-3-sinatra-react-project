class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/users" do
    user = User.all
    user.to_json(include: :messages)
    # { message: "Good luck with your project!" }.to_json
  end

  get "/users" do
    users = []
    5.times do 
      users << User.all.sample
    end
    users.to_json(include: :messages)
  end

end
