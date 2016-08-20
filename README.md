# Test app to reproduce bug using Rails 5, rails-controller-testing and bugsnag/haml gems

The gem rails-controller-testing is needed in this project in order to use 
"assigns" in tests. With the checked-in gemfile, the tests run as expected.
However, if either of the haml or bugsnag gems (or both) are included in the 
gemfile (they are currently commented out), a view spec fails.

An attempt at a concise bug description:
* There are two helper modules - FoosHelper and GenericHelper (besides 
  ApplicationHelper which is empty).
* The show view for Foo calls two helper methods. One is from FoosHelper and
  one from GenericHelper. The view works normally when running the server.
* The view spec for the show helper works with the project as checked in.
* If either the haml gem or the bugsnag gem are included in the gemfile,
  the view spec fails because the GenericHelper module is no longer available
  to the view.
* If the rails-controller-testing gem is removed from the gemfile, the view
  spec passes, even with haml and/or bugsnag. But of course the controller 
  spec fails since it uses assigns.
