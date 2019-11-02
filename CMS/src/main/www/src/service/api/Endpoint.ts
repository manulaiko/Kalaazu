import axios from 'axios';

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

    /**
     * Constructor.
     *
     * @param http     Axios instance.
     * @param endpoint Endpoint path.
     */
    constructor(http: typeof axios, endpoint: string) {
        this.http = http;
        this.http.defaults.baseURL += endpoint
    }
}