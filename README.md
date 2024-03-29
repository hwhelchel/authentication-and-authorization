# P3 Sinatra Authentication And Authorization

## Learning Competencies

* Implement user login and authentication.

## Summary

Using Sinatra, create a user signin/signup and authenticate signed in users
before displaying information.

## Releases

### Release 0 : Implement Sign In

Starting from the `sinatra_skeleton_mvc` your cohort has been using,  achieve
the following functionality:

1. A user can SignUp for a new account with an email and password.
2. User passwords are stored encrypted in the password-hash field.  You may
   implement this yourself or use the `bcrypt` gem.
3. An existing user can SignIn
4. If a user is not signed in, they only see a welcome message on the home page.
5. If a user is signed in, they can see all users on the home page.
6. A user can SignOut using a `delete` route
7. A helper method `current_user`  returns the current signed-in user and is
   used to display appropriate SignIn / SignOut portions of the view.

### Release 1: Validation (optional)

Demonstrate model validation, error messages, and user access levels.

* Add validation to the user model including password length and appropriately
  formated email.
* Display appropriate error messages to the user for invalid data.
* Add a field to store user access level (Admin / Student) and limit
  functionality to different users leves. (i.e. an Admin can edit users but a
  Student can only see other users).


<!-- ##Optimize Your Learning  -->

## Resources
