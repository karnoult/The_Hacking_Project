require 'watir'
require 'pry'

class FacebookScrapper

  attr_accessor :browser

  def initialize
    # open a firefox browser
    @browser = Watir::Browser.new :firefox
  end

  # log into Facebook
  def login

    @browser.goto "https://www.facebook.com/"

    @browser.text_field(id: 'email').set("kevin.arnoult@gmail.com")
    @browser.text_field(id: 'pass').set(ENV['fb'])

    @browser.text_field(id: 'pass').send_keys(:enter)

  end

  # click on see more to see all members
  def display_members(url_members)

    @browser.driver.manage.timeouts.implicit_wait = 5

    @browser.goto(url_members)

    while true
       begin
        link_see_more = @browser.element(:xpath => "//a[@class='pam uiBoxLightblue uiMorePagerPrimary']").wait_until_present
        link_see_more.click
      rescue Watir::Exception::UnknownObjectException, Watir::Wait::TimeoutError
        break
      end
    end

  end

  # display all members shown on a group members page
  def get_members
    @browser.elements(:xpath => "//div[@class='fsl fwb fcb']/a").each do |member|
      puts member.text
    end
  end

  def close
    @browser.close
  end

end

fbScrapper = FacebookScrapper.new
fbScrapper.login
sleep(5)
fbScrapper.display_members("https://www.facebook.com/groups/244757739315035/members/")
fbScrapper.get_members
fbScrapper.close
