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

    case    
    when type.to_sym == :hunt && @jim.success?
      puts " [+] [FOUND!]".white + " #{ print_name(name)} found on #{ print_url(site) }".yellow
    when type.to_sym == :hunt && !@jim.success?
      puts " [-] #{ print_name(name) } not found on #{ print_url(site) }".red
    when @jim.success?
      puts " [-] #{ print_name(name) } is taken on #{ print_url(site) }".red
    else
      puts " [+] [FREE!]".white + " #{ print_name(name) } is free on #{ print_url(site) }".yellow
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
    return name
  end
end
