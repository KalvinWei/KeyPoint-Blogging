# Documentation
This file contains the documentation of page design, database design, etc.
Kalvin added a line.

## Project structure
```
.
|- .idea
|- doc
|- lib
|- out
|- scripts
    |- initSchema.sql
    `- sampleData.sql
|- src
    `- ictgradschool.project
        |- servlet
        |- DAO
        |- util
        `- model
            |- data
            |- viewModel
            `- jsonProvider
`- web
    |- images
        |- avatars
        `- covers
    `- WEB-INF
        |- lib
        |- res
        |- jsp
            `- shared
```

## Database Schema
- **user**
(**id**, userName, nickName, firstName, lastName, dateOfBirth, email, phone, signature, description, passwordHash, salt, iteration, *avatar)

- **article**
(**id**, title, content, time, isDeleted, *user, *cover)

- **comment**
(**id**, content, time, isDeleted, *user, *article, *parent)

- **avatar**
(**id**, filePath)

- **cover**
(**id**, filePath)

- **likeArticle**
(***user**, ***article**)

- **likeComment**
(***user**, ***comment**)

- **tag**
(**id**, description)

- **hasTag**
(***article**, ***tag**)

## API Design
| url | type | description | example |
|:---|:---:|:---:|:---:|
| ~/ | html | displays the index page | - |
| ~/index | html | displays the index page | - | 
| ~/guestPage |html| displays the index page | - |
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
