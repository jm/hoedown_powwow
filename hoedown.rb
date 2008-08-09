# Hint: change the tab size
# Why is the conference a class and not Conference.new(:regional, "Hoedown") ?

module Conferences
  module Regional
  
    class Event
      attr_reader :year
    end
  
    class Hoedown < Event
      # Please don't edit this.  Or I'll hunt you.
      def initialize(year=Time.now.year)
        @year = year
      end
      
      def run
        puts "YEE HAW!"
        self
      end
      
      def away      # no bang methods without matching non-bang methods!
        puts "w00t"
      end
      
      def free?
        @year == 2009
      end
      
      def to_s
        %w(win)
      end
    end
  end
end

twothousandeight = Conferences::Regional::Hoedown.new(2008)
twothousandeight.run.away

twothousandnine = Conferences::Regional::Hoedown.new(2009)
twothousandnine.free?

require 'rubygems'
require 'test/unit'
require 'mocha'

require 'hpricot'
require 'open-uri'

class Tweeter
  def initialize(login)
    @login = login
  end

  def url
    "http://twitter.com/#{@login}"
  end
  
  def document
    Hpricot(open(url))
  end
  
  def self.get(login)
    tweeter = new(login)
    tweeter.get
  end
  
  def friends_element
    document.at("div#friends")
  end
end

class TweeterTest < Test::Unit::TestCase
  def test_should_have_the_correct_url
    assert_equal "http://twitter.com/hoedown", Tweeter.new('hoedown').url
  end
  
  def test_should_have_the_web_page
    document = Tweeter.new('hoedown').document
    assert_instance_of Hpricot::Doc, document
  end
  
  def test_should_have_the_friends_div
    tweeter = Tweeter.new("hoedown")
    assert_instance_of Hpricot::Elem, tweeter.friends_element
  end
  
  # maybe do a test to grab a single friend first. Then we can work out the collection is grabbed.
  #def test_should_have_a_friend
  #  tweeter = Tweeter.new("hoedown")
  #  assert_instance_of Friend, tweeter.friends.first
  #end
  
  # tests to check validity of friends div?
  # we need to get people to input their logins :)
  # then we can use the test to confirm they have
end

class Friend

end

class FriendTest < Test::Unit::TestCase
  def test_should_be_able_to_parse_the_html_for_a_single_friend
    xml = <<-XML
<span class="vcard">
    <a title="Someone's name" rel="contact" class="url" href="http://twitter.com/someone"><img width="24" height="24" src="http://s3.amazonaws.com/twitter_production/profile_images/zzzzzz/me_mini.jpg" id="profile-image" class="photo fn" alt="Alt"/></a>
</span>
    XML
    friend = Friend.parse(xml)
    assert_instance_of Friend, friend
    assert_equal "
  end
end

class HotTestingAction < Test::Unit::TestCase
  def test_should_output_some_hillbilli_isms
    hoedown = Conferences::Regional::Hoedown.new
    hoedown.expects(:puts).with("YEE HAW!")
    hoedown.expects(:puts).with("w00t")
    hoedown.run.away
  end
    
  def test_hoedown_should_be_free_in_2009
    hoedown = Conferences::Regional::Hoedown.new(2009)
    assert hoedown.free?
  end
  
  def test_hoedown_should_not_be_free_in_2008
    hoedown = Conferences::Regional::Hoedown.new(2008)
    assert_equal false, hoedown.free?
  end

  def test_hoedown_should_be_full_of_win
    hoedown = Conferences::Regional::Hoedown.new
    assert hoedown.to_s.include?("win")
  end
  
  def test_hoedown_should_contain_everyone_who_is_actually_here
  end
end

# I announced a separate document for notes. <-- Where?
# There is no rescue on the Timeout::Error
def zomg_this_is_a_crazie_method_that_will_pretty_much_screw_you_like_woah!
  loop do
    require 'timeout'
    Timeout.timeout(4) do
      loop do
        puts 'i like pie'
      end
    end
  end
end