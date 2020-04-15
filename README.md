# **Regime - Rails Capstone Project**

> This project consists of building a site intended for smartphones, that consist of grouping the nutriments consumed by a given user while calculating the total calories consumed.

### Built With

- Ruby v2.7.0
- Ruby on Rails v6.0.2.2

## **Live Demo**

**_[Deployed on Heroku!!](https://regime-app.herokuapp.com/)_**

# Prerequisites

The development environment uses `Ruby`, hence install ruby before proceeding.

- Mac OS - `brew install ruby`

- Linux - `sudo apt-get install ruby-full`

- windows - Download RubyInstaller [here](https://rubyinstaller.org/), run it, and you are done!

### ⭐️ Installing Dependencies

_(If you have **Bundler** installed "To Check if **Bundler** is installed, run this command \*\*\_bundle -v_**, if you get **_Bundler version 2.x.x_\*\*", please skip to the next step!)\_

> To install **Bundler** run this command:

```
  gem install bundler
```

Now, you are ready to install the _Gemfile_ dependencies. Run the following command and you are good to go:

```
  bundle install
```

## Installation and set-up

1. Clone the project - git clone`https://github.com/simoxsimo/regime.git`

2. Run `bundle` to get all the gems.

3. Go to _config/database.yml_ change password to your postgres DB password, or follow this [guide](https://www.ionos.com/community/hosting/postgresql/how-to-use-postgresql-with-your-ruby-on-rails-application-on-ubuntu-1604/)

4. Run `sudo service posgresql start`

5. Run `rails db:migrate`

### ⭐️ Running the code

Inside The project Repository run the following command:

```
    $ rails server
```

Then, go to **_http://localhost:3000/_**

### ⭐️ Add populating the database using seed

1. Run `rails db:seed` to populating a database with the initial data needed for a Rails project.

2. Login using `admin` or `seed{n}` where (0 < n < 11).
for example: for n = 1 our seed will be `seed1`


### ⭐️ Testing the code with Rspec

Inside The project Repository run the following command:

```
    $ rspec
```

# A Simple Use Case

### ⭐️ Home Page & Sign Up
![1](https://user-images.githubusercontent.com/57480558/79395190-a7fe2b00-7f68-11ea-8f4d-a2e567fc377c.gif)

### ⭐️ Profile Page & Group Creation
![2](https://user-images.githubusercontent.com/57480558/79395191-a896c180-7f68-11ea-8c5f-60a90d080044.gif)

### ⭐️ Creating Nutriment _(Group Member)_
![3](https://user-images.githubusercontent.com/57480558/79395195-a9c7ee80-7f68-11ea-9698-1e86d6f2acd5.gif)

### ⭐️ Creating Nutriment _(Groupless)_
![4](https://user-images.githubusercontent.com/57480558/79395193-a92f5800-7f68-11ea-81f6-8a9bfdf4080b.gif)

## **Author**

👤 **Mohammed TOUILI**

- Github: [@simoxsimo](https://github.com/simoxsimo)
