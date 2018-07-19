# ultimate_townhall
**Ultimate Townhall** is a program that contacts all Townhalls from 3 French departments

## Tree structure
```
ultimate_townhall
├── .gitignore
├── .env
├── README.md
├── Gemfile
├── Gemfile.lock
├── app.rb
├── db
│   └── townhalls.csv
└── lib
    ├── app
    │   ├── townhalls_scrapper.rb
    │   ├── townhalls_mailer.rb
    │   ├── townhalls_adder_to_db.rb
    │   └── townhalls_follower.rb
    └── views
        ├── done.rb
        └── index.rb
```

## How to use the program
Install all dependancies:
```
$ bundle install
```
Execute:
```
$ ruby app.rb
```

## What the program does
The program:
1. Scrapes data from a web page
2. Sends emails to Townhalls via
3. Gets townhall Twitter handles
4. Follows Twitter accounts
5. Adds Twitter handles in JSON database

## Authors
*Team Grenoble*, THP Session 5:
+ Tom Ballu
+ Nico Bertin
+ Ludo Bourgoin

From [The Hacking Project](https://www.thehackingproject.org/).
