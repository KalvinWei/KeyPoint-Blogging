function enableFollow(id) {
    $(`#followButton_${id}`).click(function() {
        $.ajax({
            type: "POST",
            url: "./follow",
            data: $(`#followForm_${id}`).serialize(),
            success: function() {
                $(`#followForm_${id}`).toggleClass("d-none");
                $(`#unfollowForm_${id}`).toggleClass("d-none");
                $(`#followers_${id}`).text(+$(`#followers_${id}`).text() + 1);
            }
        });
        return false;
    });
}

function enableUnfollow(id) {
    $(`#unfollowButton_${id}`).click(function() {
        $.ajax({
            type: "POST",
            url: "./unfollow",
            data: $(`#unfollowForm_${id}`).serialize(),
            success: function() {
                $(`#followForm_${id}`).toggleClass("d-none");
                $(`#unfollowForm_${id}`).toggleClass("d-none");
                $(`#followers_${id}`).text(+$(`#followers_${id}`).text() - 1);
            }
        });
        return false;
    });
}

function checkFollow(followee, follower) {
    $.getJSON(`./checkFollowStatus?followee=${followee}&&follower=${follower}`, (res) => {
        if (res.status === "success") {
            $(`#unfollowForm_${followee}`).toggleClass("d-none");
        } else {
            $(`#followForm_${followee}`).toggleClass("d-none");
        }
    })
}