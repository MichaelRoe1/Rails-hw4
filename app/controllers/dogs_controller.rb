class DogsController < ApplicationController
  # The controller for dogs.  Makes an implicit call to render "views/users/method_name.html.erb" at the end of every method.

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new #will create a new instance of the dog variable
  end

  def create
    @dog = Dog.create(dog_params)
    if @dog.save
      redirect_to @dog
    else 
      render "new" #this takes you to the new view page for dog
    end
  end

  def show
    @dog = Dog.find(params[:id]) #Query for the dog with id. 
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age) #returns hash function for values: age, name, whcih correspond to the value dog in params. 
  end
end