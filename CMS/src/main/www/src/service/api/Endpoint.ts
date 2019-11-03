import axios from 'axios';
import Vue from 'vue';

/**
 * Endpoint class.
 * ===============
 *
 * Base class for all endpoints.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
export default class Endpoint {
    http: typeof axios;
    vue: typeof Vue;

    /**
     * Constructor.
     *
     * @param http     Axios instance.
     * @param vue      Vue instance.
     * @param endpoint Endpoint path.
     */
    constructor(http: typeof axios, vue: typeof Vue, endpoint: string) {
        this.http = http;
        this.vue = vue;
        this.http.defaults.baseURL += endpoint
    }
}