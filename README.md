biggest question is when do you really need a super concurrent scalable framework?

Companies:
https://github.com/doomspork/elixir-companies

https://usecanvas.com/

https://www.hioperator.com/

https://www.talkdesk.com/

https://discordapp.com/

http://crankwheel.com/

http://badger-app.com/

Pinterest & Bleacher Report

http://elixirhunt.com/ - elixir jobs

Quick Points about Elixir:
------------
1.) Elixir ships with a build tool called Mix. Falls back to use rebar for erlang projects. Mix is awesome and IMHO way more stable that rebar (Had problems with erlang libs shipping diff versions of rebar binaries in the git repo itself).

​​mix​​ ​​ecto.create​

Why Phoenix:
------------

I enjoyed developing with Phoenix and it's really similar to Rails in its structure. The differences are about having views+templates (decorator pattern) instead of Rails' plain views (which would be Phoenix's templates) and having first class handlers for websockets.

Why Not Phoenix:
------------
1) There aren't enough developers and it won't be wise for a customer to become too dependent from me (or any other developer)
2) There isn't an ecosystem comparable to the Rails one yet. Example: it can take forever to develop a replacement for all the basic functionality a Rails developer gets for free from a gem like devise (everything that revolves around authentication).
3) Most of the time, performance doesn't matter. You won't have thousands or millions of people using your app at once.

Phoenix Database:
------------
defaults to postgresql
but can also work for MySQL, MSSQL, SQLite, and more. The list will grow

Ecto similar to active record

Ecto also has a feature called changesets that holds all changes you want to perform on the database. It encapsulates the whole process of receiving external data, casting and validating it before writing it to the database.

Ecto is likely going to be a little different from many of the persistence layers you’ve used before. If you want Ecto to get something, you have to explicitly ask for it. This feature will probably seem a little tedious to you at first, but it’s the only way to guarantee that your application has predictable performance when the amount of data grows.

You learn Sequelize in this class. And if you can do sequelize, Ecto is cake. Active Record from Ruby On Rails is the easier

Phoenix Models:
------------
in Phoenix, models, controllers, and views are layers of functions. Just as a controller is a layer to transform requests and responses according to a communication protocol, the model is nothing more than a group of functions to transform data according to our business requirements.

In this book, we use the word schema to describe the native form of the data, and the word struct to refer to the data itself, but structs are not models. In fact, many functions from our model layer might not deal with our application’s structs at all. They can manipulate other structures such as changesets and queries. The important thing to understand is that the model is the layer of functions that supports our business rules rather than the data that flows through those functions.

Phoenix JavaScript:
------------
Brunch is a build tool written in Node.js. We’ll use Brunch to build, transform, and minify JavaScript code. Processing assets in this way makes your page load much more efficiently. Brunch not only takes care of JavaScript but also CSS and all of our application assets, such as images.

  Chris says:
  Why Brunch?
  Instead of building yet another asset-build tool, the Phoenix team decided to leverage one of the many tools available in the Node.js ecosystem. We spent several weeks evaluating, using, and deploying many of the options available. Brunch was our first choice because it’s simple to use, configurable, and fast.

  We know this choice might not resonate with all developers, so Phoenix allows you to use the build tool of your choice. Not a single line of code in Phoenix knows about Brunch. All the configuration is in your application. You can even skip Brunch altogether when creating a new app by using the --no-brunch option. If you can tell your build tool to compile your static files to priv/static, you’re good to go. You can even change your config/dev.exs file so Phoenix sets up a watcher for your favorite tool.

uses es6 out of the box

Phoenix wraps the contents for each JavaScript file you add to web/static/js in a function and collects them into priv/static/js/app.js. That’s the file loaded by browsers at the end of web/templates/layout.html.eex when we call static_path(@conn, "/js/app.js").

Since each file is wrapped in a function, it won’t be automatically executed by browsers unless you explicitly import it in your app.js file. In this way, the app.js file is like a manifest. It’s where you import and wire up your JavaScript dependencies.

The vendor directory is the exception to this rule. If you add an external JavaScript file to web/static/vendor, it’ll be automatically executed at the bottom of our layout. That way, external dependencies are never imported.

Brunch ships with a command-line tool, and using it is straightforward. You need to know only three commands:

```
​ 	​$ ​​brunch​​ ​​build​
​ 	​$ ​​brunch​​ ​​build​​ ​​--production​
​ 	​$ ​​brunch​​ ​​watch​
```

The first command builds all of your static files, compiling and copying the results to priv/static. The second one builds and minifies them, doing everything you’d expect for deploying JavaScript and style sheets to production. The third command is used during development, so Brunch automatically recompiles the files as they change.

Phoenix Socket Authentication
------------------------------

For request/response–type applications, session-based authentication makes sense. For channels, token authentication works better because the connection is a long-duration connection. With token authentication, we assign a unique token to each user. Tokens allow for a secure authentication mechanism that doesn’t rely on any specific transport.

Programmers often ask why they can’t access their session cookies in a channel. The answer is that this would be insecure over WebSockets because of cross-domain attacks. Also, cookies would couple channel code to the WebSocket transport, eliminating future transport layers. Fortunately, Phoenix has a better way: the Phoenix.Token.

# RumbleFix

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
