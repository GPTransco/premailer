# -*- encoding: UTF-8 -*-

require File.expand_path(File.dirname(__FILE__)) + '/helper'

class TestPremailer < Premailer::TestCase
  def test_mso
    html = <<-END_HTML
      <html><mso><h1>ADD</h1></mso></html>
    END_HTML

    premailer = Premailer.new(html, :with_html_string => true, :adapter => :nokogiri)
    assert_includes premailer.to_inline_css, "<html><body><!--[if mso]><h1>ADD</h1><![end]--></body></html>"
  end
end
