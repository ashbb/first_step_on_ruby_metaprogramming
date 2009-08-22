# md2html.rb
require 'BlueCloth'

HEAD =<<EOS
<html><head><script type="text/javascript" src="/js/code_highlighter.js"></script>
<script type="text/javascript" src="/js/code_highlighter_ruby.js"></script>
<base target="content">
<link rel=StyleSheet href="/css/style.css" type="text/css" nedia=screen>
</head>
<body>
EOS

Dir.glob("../md/*.md").each do |mfile|
  b = BlueCloth.new IO.read(mfile)
  html = HEAD
  html += b.to_html.gsub('<code>', '<code class="ruby">')
  html << '</body></html>'
  hfile = "../html/" + File.basename(mfile).sub('.md', '.html')
  open(hfile, 'w'){|f| f.puts html}
end
