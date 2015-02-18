FactoryGirl.define do
  factory :user do
    flickr_name { :flickr_name }
    password { :blahblah }
    encrypted_password { :encrypted_password}
    uid {:"129561707@N08"}
    location {:London}
  end

end
