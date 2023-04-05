# The Art of Routing in Flask

## Metadata

* Author: *Todd Birchard*
* Full Title: The Art of Routing in Flask
* Category: #Type/Highlight/Article
* URL: https://medium.com/p/2ee13d9c11bc

## Highlights

* Empower your Flask application to grow dynamically with intelligent routes and well-structured views.
* It’s hard to imagine a more critical feature of web frameworks than routing: the humble act of mapping URLs to actions, such as serving pages or data. It isn’t often you find somebody sad or miserable enough to expand on such an inglorious feature. As it turns out, I am apparently both and miserable enough to be the kind of person who writes tutorials about routing.
* @app.route("/") is a Python decorator that Flask provides to assign URLs in our app to functions easily. It's easy to understand what is happening at first glance: the decorator is telling our @app that whenever a user visits our app domain (myapp.com) at the given .route(), execute the home() function. If you aren't familiar with Python decorators, they're essentially logic which “wraps” other functions; they always match the syntax of being a line above the function they're modifying.
* In addition to accepting the URL of a route as a parameter, the @app.route() decorator can accept a second argument: a list of accepted HTTP methods. By default, a Flask route accepts all methods on a route (GET, POST, etc.). Providing a list of accepted methods is a good way to build constraints into the route for a REST API endpoint, which only makes sense in specific contexts.
* Static route URLs can only get us so far, as modern-day web applications are rarely straightforward. Let’s say we want to create a profile page for every user that creates an account within our app or dynamically generate article URLs based on the publication date. Here is where variable rules come in.
* Now that we’re industry-leading experts in defining route URLs, we’ll turn our attention to something a bit more involved: route logic. The first thing we should recap is the types of responses a view can result in. The top 3 common ways a route will conclude will be with generating a page template, providing a response, or redirecting the user somewhere else (we briefly looked over these in part 1)
* Making a Response Object
* If we’re building an endpoint intended to respond with information to be used programmatically, serving page templates isn’t what we need. Instead, we should look to make_response().
* Redirecting Users Between Views
* The last of our big three route resolutions is redirect(). Redirect accepts a string, which will be the path to redirect the user to. This can be a relative path, absolute path, or even an external URL:
* The Request Object
* request() is one of the "global" objects we mentioned earlier. It's available to every route and contains all the context of a request made to the said route. Take a look at what things are attached to request which we can access in a route:
* request.method: Contains the method used to access a route, such as GET or POST. request.method is absolutely essential for building smart routes: we can use this logic to have one route serve multiple different responses depending on what method was used to call said route. This is how REST APIs provide different results on a GET request versus a POST request ( if request.method == 'POST': can open a block only pertaining to POST requests in our route).
* request.args: Contains the query-string parameters of a request that hit our route. If we’re building an endpoint that accepts a url parameter, for example, we can get this from the request as request.args.get('url’).
* request.data: Returns the body of an object posted to a route.
* request.form: If a user hits this route as a result of form submission, request.form is our way of accessing the information the form posted. For example, to fetch the provided username of a submitted form, request.form\['username'\] is used.
* request.headers: Contains the HTTP response headers of a request.
* The “g” Object
* Let’s say we want a view to access data that isn’t passed along as part of a request object. We already know we can't pass parameters to routes traditionally: this is where we can use Flask's g. "G" stands for "global," which isn't a great name since we're restricted by the application context, but that's neither here nor there. The gist is that g is an object we can attach values to.
* @app.before_request(): Defining a function with the .before_request() decorator will execute said function before every request is made. Examples of when we might use this could include things like tracking user actions, determining user permissions, or adding a "back button" feature by remembering the last page the user visited before loading the next.
* Error handling
* What happens when a user of our app experiences a fatal error? Flask provides us a decorator called errorhandler() which serves as a catch-all route for a given HTTP error. Whenever a user experiences the error code we pass to this decorator, Flask immediately serves a corresponding view:
* @app.errorhandler(404)
  def not_found():
  """Page not found."""
  return make_response(render_template("404.html"), 404)
* See how we used make_response() in conjunction with render_template()? Not only did we serve up a custom template, but we also provided the correct error message to the browser. We're coming full-circle!
* The above example passes 404 to the @app.errorhandler() decorator, but we can pass any numerical HTTP error code. We might not know the nuances of how a complex app will fail under a load of thousands of users, but unforeseen errors will certainly occur. We can (and should) account for errors before they occur by using the @app.errorhandler() decorator to ensure our users won't be left in the dark.
* @app.errorhandler(404)
  def not_found():
  """Page not found."""
  return make_response(render_template("404.html"), 404)
  @app.errorhandler(400)
  def bad_request():
  """Bad request."""
  return make_response(render_template("400.html"), 400)
  @app.errorhandler(500)
  def server_error():
  """Internal server error."""
  return make_response(render_template("500.html"), 500)
* @login_required (from Flask-Login): Slap this before any route to immediately protect it from being accessed from logged-out users. If the user is logged in, @login_required lets them in accordingly. If you're interested in user account management in Flask, check our post about Flask-Login.
* @expose (from Flask-Admin): Allows views to be created for a custom admin panel.
* @cache.cached() (from Flask-Cache): Cache routes for a set period of time, ie: @cache.cached(timeout=50).
