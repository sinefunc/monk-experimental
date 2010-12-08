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

* Based on [http://github.com/monk/experimental](Monk Experimental).
* Works with old monk installations. (pre 1.0)
* No ORM.
* Configuration scheme is different -- it loads all of `config/*.rb`, starting with
  the defaults. Use `Main.set :xxx` to set config files, and `settings.xxx` to get them.
* Has some new helpers based on sinatra-helpers.
* Uses JsFiles (to compress JS files) and AgentSniff (to do browser detection).

