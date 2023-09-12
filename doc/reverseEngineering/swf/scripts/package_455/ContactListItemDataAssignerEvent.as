package package_455 {

import flash.events.MouseEvent;

import package_260.class_1659;

public class ContactListItemDataAssignerEvent extends MouseEvent {

    protected static const NAME: String = "ContactListItemDataAssignerEvent";

    public static var ICON_CLICKED: String = NAME + ".IconClicked";

    public static var var_995: String = NAME + ".inviteContactToGroup";

    public static var var_2264: String = NAME + ".removeContactRequest";

    public static var var_4016: String = NAME + ".acceptContact";

    public static var var_1525: String = NAME + ".declineContact";

    public static var var_3958: String = NAME + ".unblockContact";


    private var _vo: class_1659;

    public function ContactListItemDataAssignerEvent(param1: String, param2: class_1659) {
        super(param1, true);
        this._vo = param2;
    }

    public function get data(): class_1659 {
        return this._vo;
    }
}
}
