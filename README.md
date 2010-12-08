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

### ORM-less

The skeleton comes with no ORM. Add it yourself!

### Sinatra-style configuration

The bootstrapper loads all of `config/*.rb`, starting with the default files (like `haml.default.rb`).

 * Any example files are not loaded (eg, `config/scss.example.rb`).
 * Anything that is not `*.default.rb` or `*.example.rb` are *not* under version control.
 * To set settings: `Main.set :name, "Hello"`
 * To retrieve settings: `settings.name`

### JS Minification

Uses JsFiles (to compress JS files).

 * Edit `config/jsfiles.defaults.rb` to see which JS files are to be processed.

### And more

 * The jQuery helpers ensure that jQuery is loaded from Google servers first before
   falling back to the app-provided jQuery file.

 * Uses AgentSniff to do browser detection. The HTML class is automatically set.

 * Lots of new helpers based on `sinatra-support`.
