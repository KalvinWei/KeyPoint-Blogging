<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Profile</title>
    <%@include file="shared/_libraries.jsp" %>
    <style type="text/css">


    </style>
    <script src="./assets/js/validateUserName.js"></script>
    <script>
        //following code is to detect whether a username has already been taken.
        const originalUserName = document.getElementById("userName").value;
        document.getElementById("userName").addEventListener("input", async () => {
            const userName = document.getElementById("userName").value;
            const result = await validateUserName(userName, originalUserName);
            if (!result) {
                document.getElementById("takenName").classList.remove("d-none");
                document.getElementById("save").disabled = true;
            } else {
                document.getElementById("takenName").classList.add("d-none");
                document.getElementById("save").disabled = false;
            }
        });


        //following is to deal with the avatar adjustment
        const btnDecide = document.getElementById("btnDecide");
        const btnUpload = document.getElementById("btnUpload");
        const btnRemove = document.getElementById("btnRemove");
        const inputAvatar = document.getElementById("avatarInput");
        const imgDisplay = document.getElementById("avatarDisplay");
        const imgOptions = document.querySelectorAll("img.avatar-option");

        imgOptions.forEach(option => {
           option.onclick = () => {
               option.nextSibling.checked = true;
               imgOptions.forEach(o => {o.classList.remove("img-thumbnail")});
               option.classList.add("img-thumbnail");
           }
        });

        btnDecide.onclick = () =>{
            let chosenValue = document.querySelector("input[name='avatarOptionsRdBtn']:checked").val();


        };


    </script>
</head>
<body>
<%@include file="shared/_navbar.jsp" %>
<div id="wrapper" class="container-lg" style="max-width: 720px">
    <!-- title for this page -->
    <h4 class="title">${fn:toUpperCase(empty user.nickname ? user.userName : user.nickname)}'s Profile</h4>

    <!-- whole form -->
    <form id="profileForm" class="form-row" action="./saveProfile" method="post" enctype="multipart/form-data">
        <!-- right part in the form-->
        <div id="rightBlock" class="col-md-4 justify-content-center">

            <input type="hidden" name="originalAvatar" value="${user.avatar}">
            <img id="avatarDisplay" class="rounded-circle m-2" src="./images/avatar/${user.avatar}" style="width: 220px; height: 220px">
            <input id="avatarInput" type="file" name="avatar" accept="image/jpeg, image/png" style="display: none">
            <!-- default avatar button -->
            <div class="row justify-content-center">
                <button class="btn-light btn-sm text-secondary mx-2 px-2" data-toggle="modal"
                        data-target="optionsModal">
                    <svg class="bi bi-collection-fill" width="1.4em" height="1.4em" viewBox="0 0 16 16"
                         fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <rect width="16" height="10" rx="1.5" transform="matrix(1 0 0 -1 0 14.5)"></rect>
                        <path fill-rule="evenodd"
                              d="M2 3a.5.5 0 0 0 .5.5h11a.5.5 0 0 0 0-1h-11A.5.5 0 0 0 2 3zm2-2a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7A.5.5 0 0 0 4 1z"></path>
                    </svg>
                    select
                </button>
                <!-- default avatar selection modal window -->
                <div class="modal fade" id="optionsModal" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body justify-content-around">
                                <c:forEach var="avatar" items="${defaultAvatars}">
                                    <img src="./images/avatar/${avatar}"
                                         class="avatar-option m-2 rounded-sm" style="width: 100px; height: 100px; object-fit: cover">
                                    <input type="radio" name="avatarOptionsRdBtn"
                                           value="${avatar}" style="display: none">
                                </c:forEach>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary" id="btnDecide">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>

                <button class="btn-light btn-sm text-secondary mx-2 px-2" id="btnUpload">
                    <svg class="bi bi-arrow-up-circle" width="1.4em" height="1.4em" viewBox="0 0 16 16"
                         fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
                        <path fill-rule="evenodd"
                              d="M4.646 8.354a.5.5 0 0 0 .708 0L8 5.707l2.646 2.647a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 0 0 0 .708z"></path>
                        <path fill-rule="evenodd"
                              d="M8 11.5a.5.5 0 0 0 .5-.5V6a.5.5 0 0 0-1 0v5a.5.5 0 0 0 .5.5z"></path>
                    </svg>
                    upload
                </button>
                <button class="btn-light btn-sm text-secondary mx-2 px-2" id="btnRemove">
                    <svg class="bi bi-trash" width="1.4em" height="1.4em" viewBox="0 0 16 16" fill="currentColor"
                         xmlns="http://www.w3.org/2000/svg">
                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"></path>
                        <path fill-rule="evenodd"
                              d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"></path>
                    </svg>
                    remove
                </button>
            </div>
        </div>

        <!-- left part in the form -->
        <div id="leftBlock" class="col-md-8">
            <input id="id" type="hidden" name="id" value="${user.id}">
            <div class="form-group">
                <label for="userName">Username:</label>
                <input id="userName" type="text" name="userName" value="${user.userName}" placeholder="user name"
                       class="form-control">
                <div id="takenName" class="d-none text-danger">* This username is already taken</div>
            </div>
            <div class="form-group">
                <label for="nickname">Nickname:</label>
                <input id="nickname" type="text" name="nickname" value="${user.nickname}" placeholder="nickname"
                       class="form-control">
            </div>
            <div class="form-group">
                <label for="signature">Signature:</label>
                <input id="signature" type="text" name="signature" value="${user.signature}" placeholder="signature"
                       class="form-control">
            </div>
            <div class="form-group">
                <label for="firstName">First name:</label>
                <input id="firstName" type="text" name="firstName" value="${user.firstName}" placeholder="first name"
                       class="form-control">
            </div>
            <div class="form-group">
                <label for="lastName">Last name:</label>
                <input id="lastName" type="text" name="lastName" value="${user.lastName}" placeholder="last name"
                       class="form-control">
            </div>
            <div class="form-group">
                <label for="dateOfBirth">Date of birth:</label>
                <input id="dateOfBirth" type="date" name="dateOfBirth" value="${user.dateOfBirth.toString()}"
                       placeholder="date of birth" class="form-control">
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input id="email" type="email" name="email" value="${user.email}" placeholder="email"
                       class="form-control">
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" placeholder="description"
                          class="form-control">${user.description}</textarea>
            </div>
        </div>

    </form>
</div>
<form action="./deleteAccount" method="post">
    <button type="submit" for="profileForm" class="btn btn-dark btn-block" id="save">Save</button>
    <input type="hidden" name="userName" value="${user.userName}">
    <button type="submit" class="btn btn-danger form-control">Delete account</button>
</form>

</body>
</html>
