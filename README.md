# DECIDE 4 ME!

We've all been there. It's late, you and your friends are hungry...but for what? No one can ever agree. But now they don't have to with the help of DECIDE 4 ME! This app solves the problem of coming up with something to order, now a restaurant is given directly to you.

DECIDE 4 ME uses a Rails backend with a React frontend, and uses Bootstrap for some basic UI/aesthetics.


## Installation
Important note: This is just the backend for the app! The frontend to the app is available here: https://github.com/connorlarocca/capstone-frontend

After cloning, move to the directory where the app backend is installed.
```bash
bundle install
rails db:create db:migrate db:seed
rails server
```
At this point your backend server should be running! This can be found at http://localhost:3000/ followed by RESTFUL links.

## Usage

```bash
rails server
```

You can test web requests as documented in the `requests.http` file.

## Roadmap
DECIDE 4 ME has several functionalities built into the backend that will be fully implemented in the future! Those include:

- a FULLY FUNCTIONAL favorites system, where all necessary CRUD actions can be utilized
- a seperate "portal" for restaurant accounts to add their restaurant/s and edit them accordingly
- a tagging system for both restaurants and users, including dietary restrictions and preferences for users, and accomodation tags for restaurants (with an important nod to spice lovers!)
