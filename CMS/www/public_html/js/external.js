var nav = new Vue({
    el: '#nav',
    data: {
        active: 'login',
    },
    methods: {
        /**
         * Toggles the form to show.
         *
         * @param string which Which form should be shown.
         * @param event  e     Fired event.
         */
        open: function(which, e) {
            e.preventDefault();
            if (which === this.active) {
                return;
            }

            $('#form-' + this.active).addClass('is-invisible');
            $('#tab-' + this.active).removeClass('is-active');
            $('#form-' + which).removeClass('is-invisible');
            $('#tab-' + which).addClass('is-active');

            this.active = which;
        }
    }
});

var forms = new Vue({
    el: '#forms',
    data: {
        login_submit: 'Login',
        register_submit: 'Register',

        login_username: '',
        login_password: '',

        register_username: '',
        register_password: '',
        register_email: '',
        register_code: '',
        register_faction: '1',
    },
    methods: {
        /**
         * Submits the form.
         *
         * @param string which Which form should be submitted.
         * @param event  e     Fired event.
         */
        submit: function(which, e) {
            e.preventDefault();
            var data = new FormData();
            var request;

            if (which === 'register') {
                data.set('username', this.register_username);
                data.set('password', this.register_password);
                data.set('email', this.register_email);
                data.set('invitationCode', this.register_code);
                data.set('factionsId', this.register_faction);

                this.$set(this.$data, 'register_submit', 'Registering...');
                request = new Request('/External/register');
            } else if (which === 'login') {
                data.set('username', this.login_username);
                data.set('password', this.login_password)

                this.$set(this.$data, 'login_submit', 'Logging in...');
                resquest = new Request('/External/login');
            }

            execute(request, {
                method: 'GET',
                body: data,
                cache: 'no-cache'
            }, '/Internal/Start');
        }
    }
});