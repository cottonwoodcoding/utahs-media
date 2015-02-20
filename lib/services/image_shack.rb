module ImageShack
  def image_shack_albums
    result = image_shack_api_call(ENV['image_shack_url'])
    result['albums'] unless result.nil?
  end

  def image_shack_auth
    result = image_shack_api_call('https://api.imageshack.us/v1/user/login', :post,
                                  {user: ENV['image_shack_user'], password: ENV['image_shack_pw']})
    result['auth_token'] unless result.nil?
  end

  def image_shack_image_src(server, filename)
    result = image_shack_api_call("https://api.imageshack.us/v1/images/#{server}/#{filename}")
    image = {}
    if result.present?
      image[:src] = result['direct_link']
      image[:description] = result['description']
      parts = result['direct_link'].split(".")
      length = parts.length
      thumb = parts.insert(length - 1, 'th').join('.')
      image[:thumb] = thumb
    end
    image
  end

  def image_shack_api_call(url, type = :get, params = {})
    c = Curl::Easy.new
    c.url = "#{url}?#{Curl::postalize(params)}"
    c.method type
    c.ssl_verify_peer = false
    c.perform
    c.response_code == 200 ? JSON.parse(c.body)['result'] : nil
  end
end
