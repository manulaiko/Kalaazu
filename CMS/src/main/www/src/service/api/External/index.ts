import axios from "axios";
import {ToastProgrammatic as Toast} from "buefy";
import Store from "@/store";
import Endpoint from "@/service/api/Endpoint";
import {Result} from "@/service/api/External/types";

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
    const result = await this.http.post<Result>("/login", {
      username: username,
      password: password
    });

    this.parseResult(result.data);
  }

  /**
   * Performs the register operation.
   *
   * @param username Register username.
   * @param password Register password.
   * @param email    Register email.
   */
  async register(username: string, password: string, email: string): Promise<void> {
    const result = await this.http.post<Result>("/register", {
      username: username,
      password: password,
      email: email
    });

    this.parseResult(result.data);
  }

  /**
   * Parses the result data.
   *
   * @param data Result data.
   */
  private parseResult(data: Result): void {
    if (data.kind == "ok") {
      Toast.open({
        message: "Successfully logged in!",
        type: "is-success"
      });
      super.store.commit("LOGIN", data.data);

      return;
    }

    if (data.kind == "not-found") {
      Toast.open({
        message: "No username/password combination found!",
        type: "is-danger"
      });

      return;
    }

    if (data.kind == "other") {
      Toast.open({
        message: data.message,
        type: "is-danger"
      });

      return
    }

    Toast.open({
      message: "Something went wrong!",
      type: "is-danger"
    });
    console.error(data);
  }
}
