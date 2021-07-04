# coding: utf-8
require 'nokogiri'

Jekyll::Hooks.register :posts, :post_convert do |post, payload|
  # post.content = post.content.gsub(/<h(\d) id="(.*?)">(.*)<\/h(\d)>/, '<h\1 id="\2">\3&nbsp;<a href="#\2" class="anchor" aria-hidden="true">&sect;</a></h\1>')

  @doc = Nokogiri::HTML(post.content)

  nodes = @doc.css("h2, h3, h4, h5, h6")
  for node in nodes
    if node['id']
      ahref = Nokogiri::XML::Node.new "a", @doc
      ahref['href'] = '#' + node['id']
      ahref['class'] = 'anchor'
      ahref['aria-hidden'] = 'true'
      ahref.content = '§' # &sect;

      node.add_child(ahref)
    end
  end

  post.content = @doc.to_html
end
