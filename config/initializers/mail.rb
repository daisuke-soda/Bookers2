ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: 'sdobsession23@gmail.com',
  password: 'soda1230',
  authentication: 'plain',
  enable_starttls_auto: true
}