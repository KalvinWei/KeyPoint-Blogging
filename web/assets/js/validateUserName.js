async function validateUserName(userName, originalUserName) {
    if (userName === originalUserName)
        return true;
    const result = await (await fetch("./validateUserName?userName=" + userName)).json();
    return result.status === "success";
}