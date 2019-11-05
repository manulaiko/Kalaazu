import axios from "axios";
import Store from "@/store";

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
  store: typeof Store;

  /**
   * Constructor.
   *
   * @param http     Axios instance.
   * @param store    Vue store.
   * @param endpoint Endpoint path.
   */
  constructor(http: typeof axios, store: typeof Store, endpoint: string) {
    this.http = http;
    this.store = store;
    this.http.defaults.baseURL += endpoint;
  }
}
