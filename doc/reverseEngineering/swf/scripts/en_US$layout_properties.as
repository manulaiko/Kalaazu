package {

import mx.resources.ResourceBundle;

public class en_US$layout_properties extends ResourceBundle {


    public function en_US$layout_properties() {
        super("en_US", "layout");
    }

    override protected function getContent(): Object {
        return {
            "constraintLayoutNotVirtualized": "ConstraintLayout doesn\'t support virtualization.",
            "basicLayoutNotVirtualized": "BasicLayout doesn\'t support virtualization.",
            "rowNotFound": "ConstraintRow \'{0}\' not found.",
            "invalidBaselineOnRow": "Invalid baseline value on row {0}: \'{1}\'. Must be a Number or of the form \'maxAscent:x\'.",
            "invalidIndex": "invalidIndex",
            "columnNotFound": "ConstraintColumn \'{0}\' not found."
        };
    }
}
}
