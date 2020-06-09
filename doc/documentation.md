# Documentation
This file contains the documentation of page design, database design, etc.

## Project structure
```
.
|- .idea
|- lib
|- out
|- doc
|   |- documentation.md     [this file]
|   |- journal.md           [diary]
|   `- roadmap.md           [plans]
|- scripts
|   |- initSchema.sql       [create tables]
|   `- sampleData.sql       [generate sample data for testing]
|- src
|   `- ictgradschool.project
|       |- servlet
|       |   |- page         [servlets which directly dispatch to jsps]
|       |   |- action       [servlets which respond to a form action]
|       |   `- ajax         [servlets which respond to ajax]
|       |- DAO              [DAOs]
|       |- model            [java beans to be passed to jsps]  
|       `- util             [utility static classes]
`- web
    |- images
    |   |- avatars          [default avatars]
    |   `- covers           [default covers]
    `- WEB-INF
        |- lib
        |- res
        `- jsp              [jsp files]
            `- shared       [shared jsp components]
```

## Database Schema
- **user**
(**id**, userName, nickname, firstName, lastName, dateOfBirth, email, signature, description, avatar, passwordHash, salt, iteration)

- **article**
(**id**, title, content, time, user, cover, isDeleted)

- **comment**
(**id**, content, time, user, article, parent, isDeleted,)

- **likeArticle**
(***user**, ***article**)

- **likeComment**
(***user**, ***comment**)

- **tag**
(***article**, **tag**)

## API Design
| url | type | description | example |
|:---|:---:|:---:|:---:|
| ~/ | html | displays the index page | - |
| ~/index | html | displays the index page | - | 
| ~/indexPage |html| displays the index page | - |
| ~/signInPage |html| displays the sign in / sign up page| - |
| ~/editProfilePage |html| displays the profile editing page | - |
| ~/editArticlePage |html| displays the article editing/creating page| - |
| ~/articlesPage |html| displays the page showing user profile and all articles| - |
| ~/articlePage |html| displays a single article| - |
| ~/signOut |action| sign out, redirect to index| - |
| ~/signIn |action| submit sign in form, redirect to the original place| - |
| ~/signUp |action| submit sign up form, redirect to profile editing page| - |
| ~/saveProfile |action| submit file editing form, redirect to sign in page| - |
| ~/deleteAccount |action| submit account deletion form, redirect to index| - |
| ~/postArticle |action| submit article editing form, redirect to this article| - |
| ~/deleteArticle |action| submit article deletion form, redirect to all articles page| - |
| ~/postComment |action| submit comment creating form, returns a json response? | - |
| ~/deleteComment |action| submit comment deleting form, returns a json response? | - |
| ~/checkUserName |json| test whether the user name is available, returns a json response | - |

## Page Design

[Page prototypes on Axure](https://3uzaen.axshare.com/)

(password: pgcert)

- Guest page (~/, ~/index, ~/guestPage)
    - contains a list of all article summaries
    - depending on login status, display user nickname and avatar or sign in link
    
- Sign in page (~/signInPage)
    - contains two forms, sign in and sign up; front end to toggle among them
    - when submitted, redirect page
    
- Edit profile page (~/editProfilePage)
    - allows the user to edit his/her profile
    
- Edit article page (~/editArticlePage)
    - allows the user to edit a certain article
    
- Articles page (~/articlesPage)
    - displays the user information, followed by all the article summaries by this user
    
- Article page (~/articlePage)
    - displays the a certain article
    - displays all the related comments
