class StringAdditionController < ApplicationController

  def index
  end

  def calculate_addition
    input = params[:input]
    string_addition = StringAddition.new(input)

    render json: { result: string_addition.add }, status: :ok
  rescue ArgumentError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

end
