var username = document.getElementById("username");
var password = document.getElementById("password");


/**
 * Builds the request data.
 *
 * @return object Request data object.
 */
function getData() {
    var form = new FormData();
    form.set("username", username.value);
    form.set("password", password.value);

    return {
        method: 'GET',
        body: form,
        cache: 'no-cache'
    };
}

/**
 * Performs the login.
 */
function login() {
    execute(new Request("/External/login"), '/Internal/Start');
}

/**
 * Performs the register.
 */
function register() {
    execute(new Request("/External/register"), '/Internal/CompanyChoose');
}

document.getElementById("login").onclick = login;
document.getElementById("register").onclick = register;