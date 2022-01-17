# My Day - To Do App

An iOS application implemented using MVC (Mode-View-ViewController) design pattern.


## General

My Day is an iOS application build using Swift and UIKit. It can be used to set daily goals and track your progress. It also displays a new quote everytime it's opened. This application was created for educational purposes.


## Implementation details

The implementation is based on the MVC (Model-View-ViewController) desig pattern. 

The application doesn't use a database, all the data is stored locally using a json file. The class IOHelpers contains the methods used to parse the data.

The main characteristic of this application, the calendar, was build based on the library [FSCalendar](https://github.com/WenchaoD/FSCalendar). All the tasks from one day are displayed using a CollectionView.


## Demo

