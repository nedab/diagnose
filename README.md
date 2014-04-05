# diagnose! BETA

A simple app for running diagnoses.
This app is everything but ready, so dont put too much work into it before checking the code yourself.

## Table of contents

 - [Quick start](#quick-start)
 - [Documentation](#documentation)
 - [Screenshots](#screenshots)
 - [ToDo](#todo)
 - [How it works](#how-it-works)
 - [AuthorS](#authorS)
 - [Copyright and license](#copyright-and-license)

## Quick start

- Clone the repo: `git clone https://github.com/nedab/diagnose.git`.
- Create your own database.yml - just use a rails 4 one with sqlite3 settings e.g.
- Or just download the whole folder and run `bundle` and `rails s`

## Documentation

There are some URL you should know:

* root is put to /diagnoses/index
* put in some ToDos or blog like notes: http://localhost:3000/mains
* putting questions into the database: http://localhost:3000/questions
* create and see categories http://localhost:3000/categories
* running a diagnosis: http://localhost:3000/diagnoses
* getting a (hardcoded) random diagnosis in math http://localhost:3000/diagnoses/mathe
* getting a (hardcoded) random diagnosis in math http://localhost:3000/diagnoses/chemie

Forgive me for not being THAT clear with my names, e.g. sindular and plural form for I am a german and the program started out in my native language.

## Screenshots

### diagnoses#index

![diagnoses_index](./shots/diagnoses_index.png "diagnoses_index")

### diagnoses#math

![diagnoses_math](./shots/diagnoses_math.png "diagnoses_math")

### diagnoses#create -> render "diagnosed"

![diagnoses_create_diagnosed](./shots/diagnoses_create_diagnosed.png "diagnoses_create_diagnosed")


## ToDo

* create a module which processes LaTeX
* put another column in place with LaTeX exercises to be send to the user after diagnoses
* establishing a whole site around the checklist core like user management etc.
* storing the results in a database rather than a session variable

## How it works

There are two databases with categories and questions which are associated.
The diagnosis is created through questions model and send an array to diagnoses controller.
That array is processed and send to diagnosed view.

## AuthorS

So far its just me, but I am happy to share ;)

And I am a hobby programmer who is working as a teacher, therefore you cant expect wonders since I am new to github as well.

## Copyright and license

Its the AGPL v3 as you can find/see in the [LICENSE](https://www.gnu.org/licenses/agpl.txt) file.
The reason is the so called "ASP loophole", this software now has to be published even when used as a web service... or something like that.
