package {

import mx.resources.ResourceBundle;

public class en_US$textLayout_properties extends ResourceBundle {


    public function en_US$textLayout_properties() {
        super("en_US", "textLayout");
    }

    override protected function getContent(): Object {
        return {
            "illegalOperation": "Illegal attempt to execute {0} operation",
            "unknownElement": "Unknown element {0}",
            "unknownAttribute": "Attribute {0} not permitted in element {1}",
            "badPropertyValue": "Property {0} value {1} is out of range",
            "expectedExactlyOneTextLayoutFormat": "Expected one and only one TextLayoutFormat in {0}\t",
            "missingStringResource": "No string for resource {0}",
            "invalidSplitAtIndex": "Invalid parameter to splitAtIndex",
            "invalidSplitAtPosition": "Invalid parameter to splitAtPosition",
            "malformedTag": "Malformed tag {0}",
            "invalidChildType": "NewElement not of a type that this can be parent of",
            "invalidReplaceTextPositions": "Invalid positions passed to SpanElement.replaceText",
            "invalidSurrogatePairSplit": "Invalid splitting of a surrogate pair",
            "badShallowCopyRange": "Bad range in shallowCopy",
            "badReplaceChildrenIndex": "Out of range index to FlowGroupElement.replaceChildren",
            "missingTextFlow": "No TextFlow to parse",
            "unexpectedXMLElementInSpan": "Unexpected element {0} within a span",
            "unexpectedNamespace": "Unexpected namespace {0}",
            "badMXMLChildrenArgument": "Bad element of type {0} passed to mxmlChildren",
            "badRemoveChild": "Child to remove not found",
            "invalidFlowElementConstruct": "Attempted construct of invalid FlowElement subclass",
            "badSurrogatePairCopy": "Copying only half of a surrogate pair in SpanElement.shallowCopy",
            "malformedMarkup": "Malformed markup {0}"
        };
    }
}
}
