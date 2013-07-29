require 'json'
def pre_json
  [ {"First Name"=>"Jill", "Last Name"=>"Smith",   "Points"=>"50"},
    {"First Name"=>"Eve",  "Last Name"=>"Jackson", "Points"=>"94"},
    {"First Name"=>"John", "Last Name"=>"Doe",     "Points"=>"80"},
    {"First Name"=>"Adam", "Last Name"=>"Johnson", "Points"=>"67"} ]
end

def json
  pre_json.to_json
end
