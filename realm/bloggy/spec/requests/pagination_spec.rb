# encoding: UTF-8
require 'spec_helper'
describe "pagination" do
  before(:each) do
    22.times { |i| Factory(:post, title: "post #{i}") }
  end

  it "should not show all posts" do
    visit "/bloggy"
    within(".content") do
      page.should_not have_content("post #{Bloggy::Config.posts_per_page + 1}")
    end
  end

  it "can go to older posts" do
    visit "/bloggy/"
    home_page = page.html
    click_on "Older posts"
    page.html.should_not eq(home_page)
  end

  it "can go to newer posts" do
    visit "#{root_path}page/2"
    page_2 = page.html
    click_on "Newer posts"
    page.html.should_not eq(page_2)
  end

  it "should not show 'newer posts' on first page" do
    visit "/bloggy"
    page.should_not have_content("Newer posts")
  end

  it "should not show 'older posts' on last page" do
    visit ("/bloggy/page/3")
    page.should_not have_content("Older posts")
  end
end
