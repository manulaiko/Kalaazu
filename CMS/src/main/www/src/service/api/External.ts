import axios from 'axios';
import Endpoint from "@/service/api/Endpoint";

type LoginResult = {
    sessionId: string
};

/**
 * External api controller.
 * ========================
 *
 * Controller for the `/external` api endpoint.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
export default class External extends Endpoint {
    /**
     * Constructor
     *
     * @param http Axios instance.
     */
    constructor(http: typeof axios) {
        super(http, "/external");
    }

    /**
     * Performs the login operation.
     *
     * @param username Login username.
     * @param password Login password.
     */
    async login(username: string, password: string): Promise<LoginResult> {
        const result = await this.http.post("/login", {
            username: username,
            password: password
        });

        return result.data;
    }
}