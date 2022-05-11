# Jungle

A mini e-commerce application built with Rails 6.1. The projects purpose for me as a developer was to 
  * Become familiar with Ruby and the Rails framework
  * Learn how to navigate an existing code-base
  * Use existing code style and approach to implement new features in unfamiliar territory
  * Apply previous learning tactics to research and become familiar with a new paradigm, language and framework
  * Throw myself in a simulation of the real world where feature and bug-fix requests are listed instead of step-by-step instructions on how to implement a solution

As a user of this application, you can create an account and order any plants we have available to you! A typical ordering processs would look like searching for the plants you want via category, adding them to your cart, and paying for them online with your card.

As an admin of this application, admin users can list and create new categories. Admins can add new products using the new category.

# Project Screenshots

## Screenshot of the homepage view
!["Screenshot of the homepage view"](https://github.com/ralphunrau/jungle-rails/blob/master/docs/HomePageView.png?raw=true)

## Screenshot of a category view
!["Screenshot of a category view"](https://github.com/ralphunrau/jungle-rails/blob/master/docs/CategoryView.png?raw=true)

## Screenshot of the cart view
!["Screenshot of the cart view"](https://github.com/ralphunrau/jungle-rails/blob/master/docs/CartView.png?raw=true)

## Screenshot of the payment view
!["Screenshot of the payment view"](https://github.com/ralphunrau/jungle-rails/blob/master/docs/PaymentView.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe