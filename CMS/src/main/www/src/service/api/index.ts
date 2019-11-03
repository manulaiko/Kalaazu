import Vue from 'vue';
import axios from 'axios';
import External from '@/service/api/External';

/**
 * API service.
 * ============
 *
 * Service for calling API endpoints.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class ApiService {
    external: External;

    /**
     * Constructor.
     *
     * @param vue Vue instance.
     */
    constructor(vue: typeof Vue) {
        this.external = new External(axios, vue)
    }
}

export default function Api(vue: typeof Vue, options: any): void {
    axios.defaults.baseURL = options.url;

    vue.prototype.$api = new ApiService(vue);
}