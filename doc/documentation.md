# Documentation
This file contains the documentation of page design, database design, etc.

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
|~/signIn|html|||
|~/editProfile|html|||
|~/editArticle|html|||
|~/article|html|||
|~/logOut|html|||
|||||
|||||
|||||
|||||


## Page Design

[Page prototypes on Axure](https://3uzaen.axshare.com/)

(password: pgcert)

- Index page (url: ~/ , ~/index)

- Login page (url: ~/login)

- Register page (url: ~/register)

- Account management page

- Authors page