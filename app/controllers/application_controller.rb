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

  get "/users/:id" do
    users = User.find(params[:id])
    users.to_json
  end

  patch "/message/:id" do
    message = Message.find(params[:id])
    message.update(
      title: params[:title],
      comment: params[:comment]
    )
    message.to_json
  end

  delete "/users/:id" do
    users = User.find(params[:id])
    users.destroy
    users.to_json
  end
  
  post "/users" do
      user = User.create(
      username = params[:username]
    )
  end

  post "/message" do
    # binding.pry
    user = User.find_or_create_by(username: params[:username])
    message = Message.create(
      user_id: user.id,
      title: params[:title],
      comment: params[:comment],
    )
    message.to_json
  end

  delete "/message/:id" do
      message = Message.find(params[:id])
      message.destroy
      message.to_json
   end



end
