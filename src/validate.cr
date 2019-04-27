require "json"

def validate(json)
  begin
    valid_flag = 1
    value = JSON.parse(json)
    err = ""
  rescue ex
    valid_flag = 0
    err = ex.message
  end
  return valid_flag, err
end
