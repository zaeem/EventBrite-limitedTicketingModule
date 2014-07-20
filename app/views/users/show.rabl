object @user

# Declare the properties to include
attributes :email, :username, :password, :title, :first_name, :last_name, :middle_name, :phone, :phone_daytime, :phone_evening, :phone_cell, :subscribe, :sale_commission, :negotiation_commission, :created_at, :updated_at

# Include a custom node with full_name for user
#node :full_name do |user|
#  [user.first_name, user.last_name].join(" ")
#end