Gem is still in alpha, many things will be added (like scrapping info from social networks).
Breaking changes are highly possible, so I do not suggest use of this gem except for development and test.  
That means, do not use it in production services, otherwise feel free to play with it.

# Moriarty

Tool to check social networks for available username.  
Idea from python tool - sherlock

---

# What it do

Search multiple social networks for free username.
It's reverse from Sherlock, so not-found username is success.
Argument `--hunt` will run search like _sherlock_ would, looking for valid users.

---

# How to install

Clone repo and enter directory:

```
git clone https://github.com/decentralizuj/moriarty.git && cd moriarty
```

Install gem and it's dependecies:

```
bundle install
```

Moriarty depend on gems: _Rest-Client, Nokogiri and Colorize._

---

# How to use

Run script from terminal, you will receive info about free/taken username.
To search for registered user, execute with `--hunt` as argument.  

Read source-code, each method is explained with examples.

```
# if run without arguments, or with `-h || --help`, help banner is printed

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

`CLI` is created to test main `class Moriarty` in terminal.
Accept 3 self methods, #find!, #hunt! and #print_url

```ruby
Moriarty.find! 'somename', 'instagram.com'
# => execute search and print colorized output

Moriarty.find! 'somename', 'github.com', :hunt
or
Moriarty.hunt! 'somename', 'github.com'
# => execute hunt and print colorized output

Moriarty.print_url 'https://www.github.com/'
# => 'github'
```  

# Lates Changes

V-0.2.0
 - Moriarty#print_name added to remove '@, #, /u/' from username when printing in cli.
 - Added 'rubygems.org' as source to search
 - Added '[+]' and '[-]' to cli output

# Contribution

At the moment I do not need any contribution on this project, but that will change after v1.
That will be in about 1 month, so you can watch repository to stay updated with latest changes.
Github is always updated before rubygems. And again, after v1, that will be automated.
