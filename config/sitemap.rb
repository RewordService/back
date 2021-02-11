require 'fog-aws'
# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://reword-web.herokuapp.com'
SitemapGenerator::Sitemap.sitemaps_host = "http://#{Rails.application.credentials.fog[:directory]}s3.amazonaws.com"
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new#s(
  #fog_provider: Rails.application.credentials.fog[:provider],
  #aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
  #aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
  #fog_region: Rails.application.credentials.fog[:region],
  #fog_directory: Rails.application.credentials.fog[:directory]
#)
SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  add '/landing', :changefreq => 'never', :priority => 0.7
  add '/home', :changefreq => 'daily', :priority => 0.9
  add '/game', :changefreq => 'never'
  add '/search', :changefreq => 'daily'
  add '/signin', :changefreq => 'never'
  add '/signup', :changefreq => 'never'
  add '/contact', :changefreq => 'weekly'
  add '/policy', :changefreq => 'weekly'
  User.find_each do |user|
    add user_path(user), :lastmod => user.updated_at
  end
end
