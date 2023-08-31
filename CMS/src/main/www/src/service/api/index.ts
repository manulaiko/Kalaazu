import Vue from "vue";
import axios from "axios";
import Store from "@/store";
import External from "@/service/api/External";
import Company from "@/service/api/Company";

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
    company: Company;

    /**
     * Constructor.
     *
     * @param store Vue store.
     */
    constructor(store: typeof Store) {
        this.external = new External(axios, store);
        this.company = new Company(axios, store);
    }
}

export default function Api(vue: typeof Vue, options: any): void {
    axios.defaults.baseURL = options.url;

    vue.prototype.$api = new ApiService(Store);
}
