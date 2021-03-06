require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a user should enter a first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
    user = User.new
    user.profile_name = 'Lebron James'
    user.email = 'kwhite@hotmail.com'
    user.first_name = 'Lebron'
    user.last_name = 'James'
    user.password = 'C0nsert!'
    user.password_confirmation = 'C0nsert!'
    assert !user.save
    puts user.errors.inspect
    assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
    user = User.new
    user.profile_name = "My Profile With Spaces"

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert !user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "a user can have a correctly formatted profile name" do
    user = User.new(first_name: 'Lebron', last_name: 'James', email: 'kwhite@hotmail.com')
    user.password = user.password_confirmation = 'C0nsert!'

    user.profile_name = 'King James'
    assert user.valid?
  end
end
