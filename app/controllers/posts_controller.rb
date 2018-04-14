class PostsController < ApplicationController
before_action :check_ownership, only: [:destroy]


  def index
      @posts = Post.all.order('created_at desc')    
  end
  
  def create
      new_post = Post.new(name: params[:name], password: params[:password], content: params[:content])
      if new_post.save
        redirect_to root_path
      else
        redirect_to new_post_path
      end    
      
  end
  
  def new
  end
  
  def edit
  end  
  
  def destroy
     @post.destroy
     redirect_to root_path
  end  


  def check_ownership
      @post = Post.find_by(id: params[:id])
      @password = params[:password]
      if (current_user==nil) && (@post.password != @password)
          redirect_to posts_path
          puts @post.password
          puts @password
          puts "1번걸려"
      elsif (current_user!=nil) && (current_user.email!="tkdqja564@likelion.org") 
         redirect_to posts_path
          puts "2번걸려"
      else
      end     
  end   
  
end