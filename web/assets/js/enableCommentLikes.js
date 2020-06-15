function enableCommentLike(id) {
    $(`#likeCommentButton_${id}`).click(function() {
        $.ajax({
            type: "POST",
            url: "./likeComment",
            data: $(`#likeCommentForm_${id}`).serialize(),
            success: function() {
                $(`#likeCommentForm_${id}`).toggleClass("d-none");
                $(`#unlikeCommentForm_${id}`).toggleClass("d-none");
            }
        });
        return false;
    });
}

function enableCommentUnlike(id) {
    $(`#unlikeCommentButton_${id}`).click(function() {
        $.ajax({
            type: "POST",
            url: "./unlikeComment",
            data: $(`#unlikeCommentForm_${id}`).serialize(),
            success: function() {
                $(`#likeCommentForm_${id}`).toggleClass("d-none");
                $(`#unlikeCommentForm_${id}`).toggleClass("d-none");
            }
        });
        return false;
    });
}

function checkCommentLike(user, comment) {
    $.ajax({
        type: "GET",
        url: `./checkCommentLikeStatus?user=${user}&&comment=${comment}`,
        success: (res) => {
            if (res.status === "success") {
                $(`#unlikeCommentForm_${comment}`).toggleClass("d-none");
            } else {
                $(`#likeCommentForm_${comment}`).toggleClass("d-none");
            }
        }
    });
}