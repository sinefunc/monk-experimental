My project
==========

Set up RVM

    rvm --rvmrc --create 1.9.2@myproject

Install dependency gems

    rvm gemset import

Start

    monk start

Run tests

    monk test

Skeleton Info
-------------

The skeleton is based on [http://github.com/monk/experimental](Monk Experimental).

  * This means no more dependency on `monk-glue`, among other things.
  * This still works with old monk installations. (pre 1.0)

### Usage

Creating a project from scratch? Install `monk` and add this skeleton to it.

    sudo gem install monk --pre
    monk add monkex https://github.com/sinefunc/monk-experimental.git

Then create an app:

    monk init my_great_app -s monkex

### ORM-less

The skeleton comes with no ORM by default.

However, there are sample config files in `config/` for Ohm and Sequel which has
instructions on how to set them up.

### Sinatra-style configuration

The bootstrapper loads all of `config/*.rb`, starting with the default files (like `haml.default.rb`).

 * To set settings: `Main.set :name, "Hello"`
 * To retrieve settings: `settings.name`

### JS Minification

Uses JsFiles (to compress JS files).

 * Edit `config/jsfiles.defaults.rb` to see which JS files are to be processed.

### HTML5 boilerplate

Some things from the HTML5 boilerplate were roughly followed:

 * Modernizr built in
 * Load JQuery/Modernizr/etc via CDN (Google's and Cachedcommon's public CDNs)
 * DD_belatedPNG
 * ...among other things (which should be fairly trivial to remove)

### And more

 * The jQuery helpers ensure that jQuery is loaded from Google servers first before
   falling back to the app-provided jQuery file.

 * Uses AgentSniff to do browser detection. The HTML class is automatically set.

 * A couple of new helpers have been added.
