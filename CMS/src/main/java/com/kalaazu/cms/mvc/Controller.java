package com.kalaazu.cms.mvc;

import com.kalaazu.cms.server.Request;
import io.vertx.ext.web.RoutingContext;

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
    public String index(RoutingContext request) {
        return "The requested page does not exist!";
    }

    /**
     * Result response.
     * ================
     *
     * Represents a result response.
     *
     * @author Manulaiko <manulaiko@gmail.com>
     */
    public static class ResultResponse {
        /**
         * Whether the result is error or not.
         */
        public boolean isError;

        /**
         * Result message.
         */
        public String message;

        /**
         * Constructor.
         *
         * @param isError Whether the result is error or not.
         * @param message Result message.
         */
        public ResultResponse(boolean isError, String message) {
            this.isError = isError;
            this.message = message;
        }

        /**
         * Returns the result as a JSON.
         *
         * @return Result as json.
         */
        @Override
        public String toString() {
            return "{\"isError\":" +
                   this.isError +
                   ",\"message\":\"" +
                   this.message +
                   "\"}";
        }
    }
}
