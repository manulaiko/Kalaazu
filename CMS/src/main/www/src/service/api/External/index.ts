import axios from 'axios';
import Store from '@/store';
import Endpoint from "@/service/api/Endpoint";
import {LoginResult} from "@/service/api/External/types";

/**
 * External api controller.
 * ========================
 *
 * Controller for the `/external` api endpoint.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
export default class Index extends Endpoint {
    /**
     * Constructor
     *
     * @param http  Axios instance.
     * @param store Vue store.
     */
    constructor(http: typeof axios, store: typeof Store) {
        super(http, store, "/external");
    }

    /**
     * Performs the login operation.
     *
     * @param username Login username.
     * @param password Login password.
     */
    async login(username: string, password: string): Promise<LoginResult> {
        const result = await this.http.post<LoginResult>("/login", {
            username: username,
            password: password
        });

        return result.data;
    }
}