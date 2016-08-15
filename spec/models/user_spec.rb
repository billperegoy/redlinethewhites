require 'rails_helper'

RSpec.describe User, type: :model do
  it "should allow a user to be created" do
    User.create(email: "foo@foo.com", password: "hello")
    expect(User.count).to eq(1)
  end

  it "should reject duplicate email addresses" do
    User.create(email: "foo@foo.com", password: "hello")
    duplicate_user = User.create(email: "foo@foo.com", password: "hello")
    expect(duplicate_user.valid?).to eq(false)
    expect(User.count).to eq(1)
  end

  it "should allow multiple uniqie users to be created" do
    User.create(email: "foo@foo.com", password: "hello")
    User.create(email: "goo@goo.com", password: "hello")
    expect(User.count).to eq(2)
  end

  it "should default to non-admin users" do
    user = User.new(email: "foo@foo.com", password: "hello")
    expect(user.admin).to eq(false)
  end
end
