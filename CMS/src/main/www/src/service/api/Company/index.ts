import axios from "axios";
import Store from "@/store";
import Endpoint from "@/service/api/Endpoint";
import {CompanyList} from "@/service/api/Company/types";

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
    super(http, store, "/company");
  }

  /**
   * Loads the companies that the user can join.
   */
  async list(): Promise<CompanyList> {
    const result = await this.http.post<CompanyList>("/login");

    return result.data;
  }
}
