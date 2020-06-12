Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '378635109762934', '0774df5e11a1af6a96bcc1764bb08eba'
  end