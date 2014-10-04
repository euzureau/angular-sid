Angular sid
===========

Angular sid is an application skeleton based on AngularJS.

Whatever the web app you need create, you will enjoy instant development
tools and features :

* an up-to-date version of [AngularJS] : 1.3-X
* [NodeJS], [Express] to run a local development instance
* [Grunt] with available tasks to check, compile, test and deploy your files
* [Angular UI], [Bootstrap] and [lessCSS] for the layout
* [Karma], [Jasmine] for the unit tests
* [Bower] & [RequireJS] to install and load all dependencies

And even more with :

* i18n translation tool
* token authentication methods
* drag n drop

available in few lines of code, already loaded in your app.

Getting Started
----
Installing and launching a new seed in 3 steps:

* clone the project:
```sh
git clone git@github.com:angular/angular-seed.git
```

* install the dependencies:
```sh
npm install
bower install
```

* launch the app:
```sh
grunt serve
```

Application tree
----
```
app/
    coffee/         --> coffee-script source file
    less/           --> less source files
    tpl/            --> angular templates folder

server/
    server.coffee   --> Node express server file

web/
    bundles/        --> folder installation for bower
    css/            --> destination of less compilation
    js/             --> destination of coffee compilation
```

Built-in commands and options
----
* build all files
```sh
grunt build
```

* launch node express local instance
```sh
grunt serve
```

Testing
-------
100% of the current is covered by unit tests.
* launch the tests:
```sh
grunt test
```
The report of code coverage is available in web/reports/

Documentation
-------
The doc is available in web/docs/.
To generate and update the documentation, use the following command:
```sh
grunt ngdocs
```
Then the documentation will be available at http://localhost:9002/docs/


[AngularJS]:https://angularjs.org/
