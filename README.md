# Private Events

This project was completed for the [private events assignment on The Odin Project](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-on-rails/lessons/private-events) that is centered around ActiveRecord associations.

### Project Summary

You want to build a site similar to a private Eventbrite which allows users to create events and then manage user signups.

A user can create events. A user can attend many events. An event can be attended by many users. Events take place at a specific date and at a location (which you can just store as a string, like “Andy’s House”).

This project will require you to model many-to-many relationships and also to be very conscious about your foreign keys and class names (hint: you won’t be able to just rely on Rails’ defaults like you have before). 

### View The Project

You can view the project live on [Heroku](https://make-it-happen-events.herokuapp.com).
![Screenshot of the project](https://i.imgur.com/h6kQBjP.png)
### About The Finished Project

On the finished project, themed as "Make It Happen":
  - Users can sign up and create events. 
  - Users are able to view and then sign up for other events. 
  - Every user's page shows the events they are signed up for
    - As well, the events they have created. 
  - Users can also see the full list of other users and their respective events.
  - The home page is a list of all upcoming events, in order of date. 
    - There is a separate page for past events. 
  - Events can be edited and deleted. 
    - Past events cannot have their details edited, but can be deleted by the creator.
  - Event locations are sorted by state for now, because I thought that would be fun.

### Going forward:

This project was just to practice ActiveRecord, however there is still room to grow this project and practice my Rails.
- More specific locations, such as addresses.
- Google Maps API integration? Embedded map previews?
- Ability for users to invite other users to their event & a way for the receiving user to accept the invite.
- The abilty to flag an event as "private".
  - Private events can only be joined through invite
  - Private events would not show up on user profiles, unless the user viewing the profile is also a member of the private event.
  - Private events would not show up at all on the main listing
- A way to follow (one way) or friend (mutual) a user
  - A page to view all events that your friends/following members are attending or created
- May be better if "upcoming/past" events were a toggle on the same page.