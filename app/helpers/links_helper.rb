module LinksHelper
  def generate_short_link(link)
    [root_url, "l/", link.token].join
  end
end
