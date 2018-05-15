<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Kalaazu</title>
    <link rel="stylesheet" href="{{ URL }}assets/css/bulma.css">
    <link rel="stylesheet" href="{{ URL }}assets/css/main.css">
    <script defer src="{{ URL }}assets/js/font-awesome.js"></script>
</head>
<body>
<section class="hero is-fullheight">
    <div class="hero-body">
        <div class="container has-text-centered is-centered">
            <div class="columns is-centered">
                <div class="column is-one-third content">
                    <h1 class="title">
                        Kalaazu
                    </h1>
                    <h2 class="subtitle">
                        Conquer the universe
                    </h2>
                    <div class="field">
                        <div id="results">
                        </div>
                    </div>
                    <div class="field">
                        <p class="control has-icons-left">
                            <input class="input" type="text" placeholder="Username" id="username">
                            <span class="icon is-small is-left">
                    <i class="fas fa-user"></i>
                  </span>
                        </p>
                    </div>
                    <div class="field">
                        <p class="control has-icons-left">
                            <input class="input" type="password" placeholder="Password" id="password">
                            <span class="icon is-small is-left">
                    <i class="fas fa-lock"></i>
                  </span>
                        </p>
                    </div>
                    <div class="buttons is-centered">
                        <button class="button is-info is-inverted is-outlined" id="login">
                            Login
                        </button>
                        <button class="button is-info is-inverted is-outlined" id="register">
                            Register
                        </button>
                    </div>
                    <p class="help">By login in or registering, you confirm that you've read and accept the Terms &
                        Conditions</p>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script src="{{ URL }}assets/js/main.js"></script>
<script>
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
        method: 'POST',
        body: form,
        cache: 'no-cache'
    };
}

/**
 * Performs the login.
 */
function login() {
    execute(new Request("{{ URL }}External/login"), '{{ URL }}Internal/Start');
}

/**
 * Performs the register.
 */
function register() {
    execute(new Request("{{ URL }}External/register"), '{{ URL }}Internal/CompanyChoose');
}

document.getElementById("login").onclick = login;
document.getElementById("register").onclick = register;

</script>
</html>
