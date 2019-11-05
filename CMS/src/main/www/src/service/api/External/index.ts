import axios from "axios";
import { ToastProgrammatic as Toast } from "buefy";
import Store from "@/store";
import Endpoint from "@/service/api/Endpoint";
import { LoginResult } from "@/service/api/External/types";

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
  async login(username: string, password: string): Promise<void> {
    const result = await this.http.post<LoginResult>("/login", {
      username: username,
      password: password
    });

    if (result.data.kind == "ok") {
      super.store.commit("LOGIN", result.data.data);
      Toast.open({
        message: "Successfully logged in!",
        type: "is-success"
      });

      return;
    }

    if (result.data.kind == "not-found") {
      Toast.open({
        message: "No username/password convination found!",
        type: "is-danger"
      });

      return;
    }

    Toast.open({
      message: "Something went wrong!",
      type: "is-danger"
    });
    console.error(result.data);
  }
}
