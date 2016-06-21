# Post API

This app pulls from an api to fill the database, displays the rows in the database, allows for deletion of a row and then the 'Update' button will refill the database from the API without adding duplicates.

To run app locally:

1. clone the repository

2. `bundle`

3. `rake db:create`

4. `rake db:migrate`

5.  Take your key for the API (sorry, I can't provide mine) and add it to `config/local_env.yml` file.  

  it will look like this:

  API_KEY: 'YOUR KEY HERE'

Check this into gitignore!!!

8. `rails s` - start your server!

9. Go to localhost:3000 and push the "Update" button    
