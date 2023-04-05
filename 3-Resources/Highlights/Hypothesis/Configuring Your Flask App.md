# Configuring Your Flask App

## Metadata

* Author: [hackersandslackers.com]()
* Title: Configuring Your Flask App
* Reference: https://hackersandslackers.com/configure-flask-applications/
* Category: #Type/Highlight/Article

## Highlights

* Every web app needs to be configured with things like database URIs and secret keys to enable critical functionality. Unlike Django, there's no monolithic settings.py file in Flask (thank god). Instead, we can choose to configure Flask via several methods. Today we're covering two topics in Flask configuration: best practices in configuration structure and configuration settings themselves. — [Updated on 2021-12-05 19:07:11](https://hyp.is/dexdiFYoEeybcddAs0aRXw/hackersandslackers.com/configure-flask-applications/)  — Group: #Topic/Dev

* What Not To Do: Inline ConfigurationThe fastest, dirtiest, and most dangerous method for configuring Flask is by directly setting config vars in source code using plain text. Amongst tutorials, it also seems to be the most common. Stop me if you've seen something like this before:from flask import Flask

app = Flask(**name**)
app.config\['FLASK_ENV'\] = 'development'app.pyFrom the perspective of an author writing tutorials for strangers, it's convenient to pretend that setting config values this way is acceptable. Surely nobody who is clicking into "How To Do This Sensational Thing in Flask" tutorials care to learn best software development practices, which encourages a lot of bad behavior and leaves many questions unanswered. For instance, why would we wait until after we create the Flask app object to set something as important as FLASK_ENV? Isn't the point of configuration to inform our app on how to function before it starts... functioning? — [Updated on 2021-12-05 19:07:21](https://hyp.is/e7HMElYoEeyL47OaN3HQ4Q/hackersandslackers.com/configure-flask-applications/)  — Group: #Topic/Dev

* As the Flask docs promise, your app's config can be modified as we did above and can be modified/changed at any time. Let's set aside the horrendous readability this creates down the line. We'll even turn a blind eye to the unimaginable shit show we create by mutating configs while our app is running.  — [Updated on 2021-12-05 19:07:29](https://hyp.is/gEMCZFYoEeydD3MBwWDNiA/hackersandslackers.com/configure-flask-applications/)  — Group: #Topic/Dev
