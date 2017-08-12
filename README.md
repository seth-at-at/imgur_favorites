### Imgur Favorites Folders


* Application that allows you to sort images from the imgur website.
* Account for [Imgur](https://www.imgur.com) is required to use the site.

## To install/run locally:

Clone down the repo

```shell

$ git clone git@github.com:seth-at-at/imgur_favorites.git

```

Then cd into the file and create the database and run migrations

```shell

$ cd imgur_favorites
$ bundle install
$ rake db:create
$ rake db:migrate
$ rails s

```

Open up on `localhost`:

If you are currently logged into Imgur when entering the site you will be logged in automatically, to see/test the Oauth step you need to make sure you're currently logged out. After doing so it will log you into Imgur as well as my site. 
