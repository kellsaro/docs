## With the Heroku Button

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

## Without It

* Clone the repo and change directory to it
* Log in with the Heroku Toolbelt and create an app: `heroku create`
* Use the mLab addon: `heroku addons:create mongolab:sandbox`
* Use the rabbitmq addon: `heroku addons:create "cloudamqp:lemur"`
* Deploy it with: `git push heroku master`
* Open in the browser: `heroku open`