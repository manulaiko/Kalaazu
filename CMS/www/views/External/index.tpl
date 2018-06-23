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
                        Conquer yo mamma
                    </h2>
                        <div class="field">
                            <div id="results">
                            </div>
                        </div>
                        <div class="tabs is-centered " id="nav">
                            <ul>
                                <li id="tab-login" class="is-active"><a @click="open('login', $event)">Login</a></li>
                                <li id="tab-register"><a @click="open('register', $event)">Register</a></li>
                            </ul>
                        </div>
                        <div id="forms">
                            <div id="form-login">
                                <div class="field">
                                    <p class="control has-icons-left">
                                        <input class="input" entity="text" placeholder="Username" v-model="login_username">
                                        <span class="icon is-small is-left">
                                <i class="fas fa-user"></i>
                              </span>
                                    </p>
                                </div>
                                <div class="field">
                                    <p class="control has-icons-left">
                                        <input class="input" entity="password" placeholder="Password" v-model="login_username">
                                        <span class="icon is-small is-left">
                                <i class="fas fa-lock"></i>
                              </span>
                                    </p>
                                </div>
                                <div class="field">
                                    <input type="submit" class="button is-info is-inverted is-outlined" @click="submit('login', $event)" v-model="login_submit">
                                </div>
                            </div>
                            <div id="form-register" class="is-invisible">
                                <div class="field">
                                    <p class="control has-icons-left">
                                        <input class="input" entity="text" placeholder="Username" v-model="register_username">
                                        <span class="icon is-small is-left">
                                <i class="fas fa-user"></i>
                              </span>
                                    </p>
                                </div>
                                <div class="field">
                                    <p class="control has-icons-left">
                                        <input class="input" entity="password" placeholder="Password" v-model="register_password">
                                        <span class="icon is-small is-left">
                                <i class="fas fa-lock"></i>
                              </span>
                                    </p>
                                </div>
                                <div class="field">
                                    <p class="control has-icons-left">
                                        <input class="input" entity="email" placeholder="Email" v-model="register_email">
                                        <span class="icon is-small is-left">
                                <i class="fas fa-envelope"></i>
                              </span>
                                    </p>
                                </div>
                                <div class="field">
                                    <p class="control has-icons-left">
                                        <input class="input" entity="text" placeholder="Invitation code" v-model="register_code">
                                        <span class="icon is-small is-left">
                                <i class="fas fa-barcode"></i>
                              </span>
                                    </p>
                                </div>
                                <div class="field control">
                                    <label class="label">Faction</label>
                                    <div class="select is-fullwidth">
                                        <select v-model="register_faction">
                                            <option value="1" selected>MMO</option>
                                            <option value="2">EIC</option>
                                            <option value="3">VRU</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="field">
                                    <input type="submit" class="button is-info is-inverted is-outlined" @click="submit('register', $event)" v-model="register_submit">
                                </div>
                            </div>
                        </div>
                        <p class="help">By login in or registering, you confirm that you've read and accept the Terms & Conditions
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
<script src="{{ URL }}assets/js/jquery.js"></script>
<script src="{{ URL }}assets/js/vue.js"></script>
<script src="{{ URL }}assets/js/main.js"></script>
<script src="{{ URL }}assets/js/external.js"></script>

</html>