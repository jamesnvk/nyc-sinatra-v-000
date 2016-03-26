class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure]) 
      if !params[:title].empty?
        @title = Title.find_or_create_by(params[:title])
        @figure.titles << @title
      end
      if !params[:landmark].empty?
        @landmark = Landmark.find_or_create_by(params[:landmark])
        @figure.landmarks << @landmark
      end
    erb :'figures/index'
  end

  get '/figures' do 
    erb :'figures/index'
  end

  get '/figures/:id' do 
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    @figure.titles << Title.find_or_create_by(params[:title])
    @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    @figure.save
    erb :'figures/show'
  end


end