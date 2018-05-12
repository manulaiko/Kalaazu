package com.kalaazu.cms.mvc;

import com.kalaazu.cms.server.Request;
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
public class Controller<M extends Model, P extends Presenter, C extends Controller> extends Component<M, P, C> {
    /**
     * Constructor.
     *
     * @param triad Parent triad.
     */
    public Controller(Triad<M, P, C> triad) {
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
    @Request
    public String index(HttpServerRequest request) {
        return "The requested page does not exist!";
    }
}
