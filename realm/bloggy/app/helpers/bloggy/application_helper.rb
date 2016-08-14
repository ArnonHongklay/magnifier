module Bloggy
  module ApplicationHelper
    include Bloggy::Engine.routes.url_helpers if ENV["RAILS_ENV"] == "test" # TODO: try and see why this is needed for specs to pass
    #Why aren't they loaded by default?
    include Bloggy::HtmlHelper
    include Bloggy::TagsHelper

    def bloggy_admin_form_for(object, options = {}, &block)
      options[:builder] = BloggyAdminFormBuilder
      form_for(object, options, &block)
    end

    def bloggy_accurate_title
      content_for?(:title) ? ((content_for :title) + " | #{Bloggy::Config.site_name}") : Bloggy::Config.site_name
    end

    def rss_head_link
      tag("link", href: feed_url, rel: "alternate", title: "RSS", type: "application/rss+xml")
    end

    def rss_icon
      social_icon("rss", feed_url, Bloggy::Config.show_rss_icon)
    end

    def github_icon
      social_icon("github", "http://github.com/#{Bloggy::Config.github_username}", Bloggy::Config.github_username)
    end

    def twitter_icon
      social_icon("twitter", "http://twitter.com/#{Bloggy::Config.twitter_username}", Bloggy::Config.twitter_username)
    end

    def linkedin_icon
      social_icon("linkedin", Bloggy::Config.linkedin_url, Bloggy::Config.linkedin_url)
    end

    def googleplus_icon
      social_icon("google-plus", Bloggy::Config.google_plus_account_url, Bloggy::Config.google_plus_account_url)
    end

    def facebook_icon
      social_icon("facebook", Bloggy::Config.facebook_url, Bloggy::Config.facebook_url)
    end

    def absolute_image_url(url)
      return url if url.starts_with? "http"
      request.protocol + request.host + url
    end

    def social_icon(foundicon, url, setting)
      return if setting.nil? || !setting
      content_tag :a, href: url, class: "social", target: "_blank" do
        content_tag :i, class: "foundicon-#{foundicon}" do # using an empty content tag for foundicons to appear. TODO: try to do otherwise and use only tag method
        end
      end
    end
  end
end
