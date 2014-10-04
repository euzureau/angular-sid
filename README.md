Angular sid
===========

Angular sid is an application skeleton based on AngularJS.

Whatever the web app you need to create, you will enjoy instant development
tools including the following features :

* an up-to-date version of [AngularJS] : 1.3-X
* [NodeJS], [Express] configured and ready to run a local development instance
* [Grunt] with available tasks to check, compile, test and deploy your files
* [Coffee-script] for writting and compiling your javascript source files
* [Angular UI], [Bootstrap] and [lessCSS] for the design part
* [Karma], [Jasmine] for the unit tests
* [Bower] & [RequireJS] to install and load all dependencies

And even more with :

* forms validation
* i18n translation tool
* token based authentication
* drag'n'drop

build with few lines of code, already loaded in your app and available through
angular directives, factories, and services.

Getting Started
----
How to install and launch a new seed in 3 steps:

* clone the project:
```sh
git clone git@github.com:angular/angular-seed.git
```

* Tnstall the dependencies:
```sh
npm install
bower install
```

* Launch the app:
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
    server.coffee   --> Node express script

web/
    bundles/        --> folder installation for bower
    css/            --> destination of less compilation
    js/             --> destination of coffee compilation
```

Built-in commands and options:
-------
After a 'Grunt serve' command, and the laucnh of express instance, a watch is
automatically running and will take care of updated files recompilation.
More commands are also available independantly :

----
* Build all files
```sh
grunt build
```

* Compile the coffee files
```sh
grunt coffee
```

* Compile the Less/CSS
```sh
grunt less
```

* Compile all templates
```sh
grunt html2js
```

Testing
-------
100% of the current project code is covered by unit tests.
* exec:
```sh
grunt test
```
The report of code coverage is available in web/reports/

Documentation
-------
To generate and update the documentation, use the following command:
```sh
grunt ngdocs
```
Then the documentation will be available at http://localhost:9002/docs/


[AngularJS]:https://angularjs.org/
[NodeJS]:http://nodejs.org/
[Grunt]:https://www.npmjs.org/package/grunt
[Angular UI]:http://angular-ui.github.io/
[Karma]:http://karma-runner.github.io/0.12/index.html
[Jasmine]:http://jasmine.github.io/
[Bower]:https://github.com/bower/bower
[RequireJS]:http://requirejs.org/
[lessCSS]:http://lesscss.org/
[Coffee-script]:http://coffeescript.org/
