 - _GIF preview v-0.2.0 - without latest changes'_

![Moriarty Preview](docs/moriarty.gif)

Gem is still in alpha, many things will be added (like scrapping info from social networks).
Breaking changes are highly possible, so I do not suggest use of this gem except for development and test.
That means, do not use it in production services, otherwise feel free to play with it.


# Moriarty

Tool to check social networks for available username.  
Idea from python tool - sherlock


# What it do

Search multiple social networks for free username.
It's reverse from Sherlock, so not-found username is success.
Argument `--hunt` will run search like _sherlock_ would, looking for valid users.


# How to install

Clone repo and install dependencies:

```bash
# Moriarty use rest-client, nokogiri and colorize gems
 git clone https://github.com/decentralizuj/moriarty.git && cd moriarty && bundle install
```  

Or install from rubygems:

> DISCLAIMER:
GitHub repository is updated before Rubygems.
Before v-1.0.0 is released, recommended way is to clone repo, or install with bundler from git.

```ruby
# local
 gem install moriarty

# bundler
 gem 'moriarty', '~> 0.2.0'

# bundler from github
 gem 'moriarty', git: 'https://github.com/decentralizuj/moriarty'
```


# How to use

Run script from terminal, you will receive info about free/taken username.
To search for registered user, execute with `--hunt` as argument.  

Read source-code, each method is explained with examples.

```ruby
# if installed localy, you can run 'moriarty' without 'ruby bin/'
#  > $ torify moriarty decentalizuj --hunt

 ruby bin/moriarty
 # => print usage instructions

 ruby bin/moriarty USERNAME1 USERNAME2 USERNAME3
 # => search for free usernames ... ... ...

 ruby bin/moriarty --hunt USERNAME1 USERNAME2 USERNAME3
 # => hunt registered usernames ... ... ...
```

To use *Moriarty* in your own project, available methods are:  

```ruby
 @jim = Moriarty.new( 'somename', 'facebook.com' )
 # => prepare request for 'https://facebook.com/somename'

 @jim.go
 # => check facebook for username 'somename', return true/false

 @jim.go site: 'github.com'
 # => search github.com, but do not change default :url

 @jim.go site: 'github.com', user: 'decentralizuj'
 # => search new user and site without changing defaults

 @jim.url
 # => 'https://facebook.com/' -> get url

 @jim.user
 # => 'somename' -> get user

 @jim.url = 'instagram.com'
 # => 'https://instagram.com/' -> set url

 @jim.user = 'moriarty'
 # => 'moriarti' -> set user

 @jim.search 
 # => alias for #go
```

**CLI** is there to test main `class Moriarty` in terminal.  
It's created from self methods: #find!, #hunt!, #print_url and #print_name
Methods with bang (#find!) run on self, while #find run on instance.

```ruby
 Moriarty.find! 'somename', 'instagram.com'
 # => execute search and print colorized output

 Moriarty.find! 'somename', 'github.com', :hunt
 or
 Moriarty.hunt! 'somename', 'github.com'
 # => execute hunt and print colorized output
```

Methods `#print_url` and `#print_name` are there to construct data for print.  
We have url and name as instance variables, so this is self method.

```ruby
# remove all extensions, if there's any (http(s), .www, .com)
# first look for 'http(s)', then 'www.', remove if found
# if domain have more routes (rubygems.org/profiles), remove it
# this way subdomains are accepted and part of site-name

 Moriarty.print_url 'https://www.github.com/'
 # => 'github'

# Remove symbols from username ('@, #, /u/')
# this will be changed in future

 Moriarty.print_name '/u/moriarty'
 Moriarty.print_name '@moriarty'
 Moriarty.print_name '#moriarty'
  # => 'moriarty'
```  

Methods `#p1` and `#p2` are there to print colorized output

```ruby
# p1 wrap string with braces, bold by default
 Moriarty.p1('mystring', :green, :white, :regular)
 # => '[mystring]' -> string is green, bracelets are white

# p2 only print string colorized, and/or bold
 Moriarty.p2('mystring', :red, :bold)
 # => 'mystring' -> red and bold
```  


# Latest Changes

Last push, will be compiled into gem V-0.3.0 when ready
 - Add methods for smart printing
 - changed colors in cli
 - added youtube as source
 - bold username and site in cli, site is capitalized

V-0.2.0
 - Moriarty#print_name added to remove '@, #, /u/' from username when printing in cli.
 - Added 'rubygems.org' as source to search
 - Added '[+]' and '[-]' to cli output


# Contribution

At the moment I do not need any contribution on this project, but that will change after v1.
That will be in about 1 month, so you can watch repository to stay updated with latest changes.
Github is always updated before rubygems. And again, after v1, that will be automated.
