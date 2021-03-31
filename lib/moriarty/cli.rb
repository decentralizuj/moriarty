# For CLI use, return colorized output
# Accepted args: ( name, site, type )
#
# name is required ~ (string or :symbol)
# site is optional ~ (default 'github.com')

class Moriarty

  # Moriarty.find! 'smartuser'      
  #  => [FOUND!] if username 'smartuser' is free on github
  #
  # Moriarty.find! :stupiduser, 'facebook.com', :hunt
  #  => [FREE!] if user 'stupiduser' is registered on facebook

  def self.find!( name, site = 'github.com', type = :search )

    @jim = Moriarty.new name.to_s, site.to_s
    @jim.go

    name = print_name(name).to_s
    site = print_url(site).to_s

    case    
    when type.to_sym == :hunt && @jim.success?
      p1('+')
      p1('FOUND!')
      p2(" #{name} found on ")
      puts p2(site, :cyan, :bold)
    when type.to_sym == :hunt && !@jim.success?
      p1('-', :red, :red)
      p2(" #{name} not found on ", :red)
      puts p2(site, :red)
   when @jim.success?
      p1('-', :red, :red)
      p2(" #{name} is taken on ", :red)
      puts p2(site, :red)
    else
      p1('+')
      p1('FREE!')
      p2(" #{name} is free on ")
      puts p2(site, :cyan, :bold)
    end
  end

  # #hunt! is alias for #find! with :hunt option
  # Check is user 'stupiduser' registered on instagram
  #  -> Moriarty.hunt! 'stupiduser', 'instagram.com'

  def self.hunt!( name, site = 'github.com', type = :hunt)
    find! name, site, type
  end

  # Remove extensions from domain name
  # Moriarty.print_url('https://www.github.com')
  #  => 'github'

  def self.print_url( site )
    site, name = site.to_s, ''
    if site.start_with?('http')
      site.gsub!("https://", '') or site.gsub!("http://", '')
    end
    site.gsub!("www.", '') if site.start_with?('www.')
    ext = site.to_s.split('.').last
    name = site.gsub(".#{ext}", '')
    name = name.split('/').first if ext.size < 5
    return name
  end

  # Remove extensions from username
  # Moriarty.print_name('@moriarty')
  #  => 'moriarty'

  def self.print_name( name )
    name.gsub!('@','') if name.to_s.start_with?('@')
    name.gsub!('#','') if name.to_s.start_with?('#')
    name.gsub!('/u/','') if name.to_s.start_with?('/u/')
    return name.to_s
  end

  def self.p1( title, color1 = :'light_green', color2 = :cyan, type = :bold )
    str = ' ['.colorize(color2) + title.to_s.colorize(color1) + ']'.colorize(color2)
    str = str.bold if type == :bold
    print str
  end

  def self.p2( title, color = :cyan, type = :regular)
    str = title.colorize(color)
    str = str.bold if type == :bold
    print str
  end
end
