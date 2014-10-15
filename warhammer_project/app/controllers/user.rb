enable :sessions

# ============ USER LOGIN/LOGOUT ===================

post '/login' do
  @user = User.find_by email: params[:email]
  if @user.nil?
    session[:error] = "You must be logged in to access this page."
    redirect '/'
  end

    @user = @user.authenticate(params[:password])
      #if ture returns user object, else false

  if @user
    session[:user_id] = @user.id
    session[:error] = nil
    redirect '/scores'

  else 
    session[:error] = "username/password is incorrect"
    redirect '/'
  end
end

get '/logout' do
  session[:user_id] = nil
  "You have logged out successfully"
  redirect '/'
end

# ============ CREATE USER ===================

get '/user/new' do 
  erb :content
end

post '/user' do 
  @user = User.create(params[:user])
  session[:user_id] = @user.id
  redirect '/'
end

# ============ EDIT USER ===================

get '/user/:id/edit' do |id|
  @user = User.find(id)
  erb :user_edit
end

patch '/user/:id' do |id|
  @user = User.find(id).update!(params[:user])
  redirect '/scores'
end

# ============ DELETE USER ===================

get '/confirm' do
  erb :confirm
end

delete '/user/:id' do |id|
  unless User.find(id).rounds.length == 0
  round = User.find(id).rounds
  round.first.destroy
  end
  User.find(id).destroy
  session[:user_id] = nil
  redirect "/confirm"
end

# ============ DISPLAY USER SCORE/PROFILE ===================

get '/scores' do
  @user = User.find(session[:user_id])
  erb :show
end

# ============ DISPLAY All Scores ===================

get '/high_scores' do
  @rounds = Round.all
  erb :high_scores
end

