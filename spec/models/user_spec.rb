require "rails_helper"

RSpec.describe User, :type => :model do
  it "orders by last name" do
    lindeman = User.create!(name: "Andy Lindeman", password: "abc123", email: "hello@example.com" )
    chelimsky = User.create!(name: "David Chelimsky", password: "abc123", email: "hi@example.com" )

    expect(User.order(:name)).to eq([lindeman, chelimsky])
  end
end
