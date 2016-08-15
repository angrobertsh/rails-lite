require 'json'
require 'byebug'

class Flash

  def initialize(req)
    @req = req
    @now = false
    cookie = req.cookies["_rails_lite_app_flash"]
    if cookie
      @now_val = JSON.parse(cookie)
    else
      @now_val = {}
    end
    @flash_val = {}
  end

  def now
    @now = true
    self
  end

  def [](key)
    @now_val[key]
  end

  def []=(key, val)
    @now_val[key] = val
    @flash_val[key] = val if @now == false
    @now = false
  end

  def store_flash(res)
    res.set_cookie("_rails_lite_app_flash", {path: '/', value: @flash_val.to_json})
  end

end
