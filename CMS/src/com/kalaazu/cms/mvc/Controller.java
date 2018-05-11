package com.kalaazu.cms.mvc;

import io.vertx.core.http.HttpServerRequest;

/**
 * Controller component.
 * =====================
 *
 * Represents the C in MV(VM)C.
 *
 * It handles the incoming HTTP routes.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Controller extends Component {
    /**
     * Constructor.
     *
     * @param triad Parent triad.
     */
    public Controller(Triad triad) {
        super(triad);
    }

    /**
     * Default route fallback.
     *
     * Called when there's no other route handler.
     *
     * @param request The HTTP request.
     *
     * @return The response.
     */
    public String index(HttpServerRequest request) {
        return "The requested page does not exist!";
    }
}
