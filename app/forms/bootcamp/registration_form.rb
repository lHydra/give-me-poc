module Bootcamp
  class RegistrationForm < Reform::Form
    property :email
    property :password
    property :name

    validation do
      required(:email).filled
      required(:password).filled
      required(:name).filled
    end
  end
end
