module Conferences
  module Regional
    class Hoedown
      # Please don't remove this.  Or I'll hunt you.
      def run!
        puts "YEE HAW!"
      end
    end
  end
end

twothousandeight = Conferences::Regional::Hoedown.new
twothousandeight.run!