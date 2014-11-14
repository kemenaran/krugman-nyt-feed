require 'open-uri'
require 'nokogiri'

class Feed

  BLOG_URL = 'http://krugman.blogs.nytimes.com/'
  BLOG_COOKIES = 'NYT-S=0MJIVCbHZCJpfDXrmvxADeHJkMU5SYMH39deFz9JchiAIUFL2BEX5FWcV.Ynx4rkFI'

  def html
    page = open(BLOG_URL, "Cookie" => BLOG_COOKIES)
    @html ||= Nokogiri::HTML(page) do |config|
      config.options = Nokogiri::XML::ParseOptions::NONET | Nokogiri::XML::ParseOptions::NOERROR
    end
  end

  def rss
    items = html.css('article').map do |article|
      date = 
      url = article.at('h3 a')['href'].split('?')[0]
      item = <<-ITEM
        <item>
          <title>#{article.css('h3').text}</title>
          <description>
            <![CDATA[ #{article.css('.entry-content').inner_html} ]]>
          </description>
          <pubDate>#{article.at('time')['datetime']}</pubDate>
          <link>#{url}</link>
          <guid>#{url}</guid>
        </item>
        ITEM
    end

    @rss ||= <<-RSS.strip
      <?xml version="1.0"?>
      <rss version="2.0" >
        <channel>
          <title>#{html.css('title').text}</title>
          <link>#{BLOG_URL}</link>
          #{items.join('')}
        </channel>
      </rss>
    RSS
  end
end
