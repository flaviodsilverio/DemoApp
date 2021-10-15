# DemoApp


This is an Example SwiftUI app that was done in a few hours. 

It consists on a list os posts, powered by `https://jsonplaceholder.typicode.com`, then we can see each post's details, the comments, and the Poster's profile.

There are a few extra system functionalities on it:
- Send emails to the poster/commenters
- Share a post
- Call the poster
- See where the poster lives in a map

Things of note:
- The Network layer. It contains a Network client that is completely generic and can be constrained to any object that can de decoded. This could easily be re-used anywhere in any project.

Lacking:
- More tests. It doesn't have a massive amount of tests since there's not a lot of business logic. 
- Error handling. There's plenty of custom errors, however they're not yet handled. 
- No paging. Due to the nature of `https://jsonplaceholder.typicode.com` it didn't make a lot of sense to this project.

A video of the small app can be found here: https://streamable.com/kqsbb9
