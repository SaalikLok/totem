FactoryBot.define do
  factory :website do
    title { 'My site' }
    url { 'mysite.com' }
  end

  factory :visit do
    full_url { 'https://mysite.com/dashboard' }
    host { 'mysite.com' }
    pathname { '/dashboard' }
    referring_host { 'google.com' }
    website
  end
end
