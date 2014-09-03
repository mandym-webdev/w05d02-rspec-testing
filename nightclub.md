# Nightclub

We all know night clubs are foolishly exclusive. Let's build a model that handles all that pretentious validation that we want to enforce before letting records into our database. We'll build a model with the following validations:

* Clubber names have to be at least two letters.
* Clubber ages must be over 21, but below 60!
* Gender may only be set as `"f"` or `"m"`.
* A new male record cannot be created unless there's a 2:1 ratio of females to males currently in the nightclub database.

## 1. Database

In the PG console, create a new database called "nightclub". Connect to the database (`\c nightclub`), and then import in the table schema from `lib/nightclub.sql`

## 2. Modeling

Run `gem install shoulda-matchers` and `gem install database_cleaner` to ensure that rspec will run. Don't worry about what these do for now.

Run Rspec on the specs directory… there will be some failing AND passing tests *(the tests are specifically written to test validations, so may pass by default without constraints)*. First make all model specs pass using validation methods!