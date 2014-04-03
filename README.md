# diagnose! BETA

A simple app for running diagnoses.
This app is everything but ready, so dont put too much work into it before checking the code yourself.

## Table of contents

 - [Quick start](#quick-start)
 - [Documentation](#documentation)
 - [ToDo](#todo)
 - [Authors](#authors)
 - [Copyright and license](#copyright-and-license)

## Quick start

- Clone the repo: `git clone https://github.com/nedab/diagnose.git`.
- Create your own database.yml - just use a rails 4 one with sqlite3 settings e.g.
- Or just download the whole folder and run `rails s`
- Change into the directory and start the server and put stuff into the database

## Documentation

There are some URL you should know:

* put in some ToDos or blog like notes: http://localhost:3000/mains
* putting questions into the database: http://localhost:3000/questions
* running a diagnosis: http://localhost:3000/diagnoses

Forgive me for not being THAT clear with my names, e.g. sindular and plural form for I am a german and the program started out in my native language.

## ToDo

* make the index page ask for a category first before going to be diagnosed
* get random questions from the pool each refreshing of web page
* make the diagnoses (http://localhost:3000/diagnosed) more precise
* put another column in place with LaTeX exercises to be send to the user after diagnoses
* establishing a whole site around the checklist core like user management etc.
* storing the results in a database rather than a session variable


## Authors

So far its just me, but I am happy to share ;)

## Copyright and license

Its the AGPL v3 as you can find/see in the [LICENSE](https://www.gnu.org/licenses/agpl.txt) file.
The reason is the so called "ASP loophole", this software now has to be published even when used as a web service... or something like that.
