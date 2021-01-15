class Api::V1::ExampleThingsController < Api::V1::BaseController

  def index
    render(json: {
      example_things: all_example_things
    })
  end

  def create
    id = params.require(:id)
    random_example_color = "#" + SecureRandom.hex(3)
    example_things = all_example_things
    new_example_thing = {id: id, random_example_color: random_example_color}

    example_things << new_example_thing
    Rails.cache.write("#{Rails.env}/example_things",
      example_things,
      expires_in: rand(15..45).minutes
    )

    render(
      status: :created,
      json: {
        success: true
      }
    )
  end

  private

  def all_example_things
    Rails.cache.read("#{Rails.env}/example_things") || []
  end

end
