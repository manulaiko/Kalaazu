package com.kalaazu.cms.mvc;

import java.util.Collections;
import java.util.Map;

/**
 * Model component.
 * ================
 *
 * Represents the M in MV(VM)C.
 *
 * It contains the data that will be used by the view.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Model<M extends Model, P extends Presenter, C extends Controller> extends Component<M, P, C> {
    /**
     * Constructor.
     *
     * @param triad Parent triad.
     */
    public Model(Triad<M, P, C> triad) {
        super(triad);
    }

    /**
     * Returns all the data of the model.
     *
     * @return Model data.
     */
    public Map<String, Object> getAll() {
        return Collections.emptyMap();
    }
}
