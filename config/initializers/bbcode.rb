require 'will_scan_string'
require 'rubygems'
require 'bundler/setup'
require 'bbcode'


handler = Bbcode::HtmlHandler.new( :b => :strong,
                                   :i => :em,
                                   :url => [ :a, { href: '%{0}' } ],
                                   :txt => ->(element){ "#{element.content.source}" },
                                   :img => ->(element){ %(<img src='#{CGI.escapeHTML(element.content.source)}'>) },
                                   :admin => ->(element, locals){ locals[:is_admin] ? element.content : "" },
                                   :color => [ :span, { :style => 'color: %{0};' } ] )

string_scanner = WillScanString::StringScanner.new
string_scanner.register_replacement "<", "&lt;"
string_scanner.register_replacement ">", "&gt;"
string_scanner.register_replacement "&", "&amp;"
string_scanner.register_replacement "\"", "&quot;"
string_scanner.register_replacement /(?:\r\n|\r|\n)/, "<br>"
string_scanner.register_replacement /[^\s@]+@[^\s@]/, ->(email){ %(<a href="mailto:#{CGI.escapeHTML(email)}">#{CGI.escapeHTML(email)}</a>) }

handler.register_element_handler :"#text", ->(text){ string_scanner.replace(text) }

Bbcode::Base.register_handler(:html, handler)
