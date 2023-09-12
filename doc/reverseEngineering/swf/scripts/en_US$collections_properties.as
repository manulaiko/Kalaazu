package {

import mx.resources.ResourceBundle;

public class en_US$collections_properties extends ResourceBundle {


    public function en_US$collections_properties() {
        super("en_US", "collections");
    }

    override protected function getContent(): Object {
        return {
            "lengthError": "length() is not available in this class.",
            "invalidInsert": "Cannot insert when current is beforeFirst.",
            "noComparator": "Cannot determine comparator for \'{0}\'.",
            "addItemAtError": "addItemAt() is not available in this class.",
            "findCondition": "Find criteria must contain all sort fields leading up to \'{0}\'.",
            "unknownMode": "Unknown find mode.",
            "toArrayError": "toArray() is not available in this class.",
            "stepSizeError": "stepSize cannot be set to a value of zero.",
            "removeItemAtError": "removeItemAt() is not available in this class.",
            "invalidCursor": "Cursor no longer valid.",
            "setItemAtError": "setItemAt() is not available in this class.",
            "findRestriction": "Find criteria must contain at least one sort field value.",
            "invalidType": "Incorrect type. Must be of type XML or a XMLList that contains one XML object. ",
            "noComparatorSortField": "Cannot determine comparator for SortField with name \'{0}\'.",
            "invalidIndex": "Invalid index: \'{0}\'.",
            "itemNotFound": "Cannot find when view is not sorted.",
            "addItemError": "addItem() is not available in this class.",
            "bookmarkInvalid": "Bookmark no longer valid.",
            "noItems": "No items to search.",
            "getItemIndexError": "getItemIndex() is not available in this class.",
            "invalidRemove": "Cannot remove when current is beforeFirst or afterLast.",
            "incorrectAddition": "Attempt to add an item already in the view.",
            "unknownProperty": "Unknown Property: \'{0}\'.",
            "itemUpdatedError": "itemUpdated() is not available in this class.",
            "bookmarkNotFound": "Bookmark is not from this view.",
            "outOfBounds": "Index \'{0}\' specified is out of bounds.",
            "removeAllError": "removeAll() is not available in this class.",
            "nonUnique": "Non-unique values in items.",
            "getItemAtError": "getItemAt() is not available in this class."
        };
    }
}
}
