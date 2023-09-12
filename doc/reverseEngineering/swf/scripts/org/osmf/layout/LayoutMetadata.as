package org.osmf.layout {

import org.osmf.metadata.Metadata;
import org.osmf.metadata.MetadataNamespaces;
import org.osmf.metadata.MetadataSynthesizer;
import org.osmf.metadata.NullMetadataSynthesizer;

public class LayoutMetadata extends Metadata {

    public static const LAYOUT_NAMESPACE: String = "http://www.osmf.org/layout/1.0";

    private static const SYNTHESIZER: NullMetadataSynthesizer = new NullMetadataSynthesizer();


    public function LayoutMetadata() {
        super();
    }

    public function get index(): Number {
        return !!this.lazyAttributes ? this.lazyAttributes.index : NaN;
    }

    public function set index(param1: Number): void {
        this.eagerAttributes.index = param1;
    }

    public function get scaleMode(): String {
        return !!this.lazyAttributes ? this.lazyAttributes.scaleMode : null;
    }

    public function set scaleMode(param1: String): void {
        this.eagerAttributes.scaleMode = param1;
    }

    public function get horizontalAlign(): String {
        return !!this.lazyAttributes ? this.lazyAttributes.horizontalAlign : null;
    }

    public function set horizontalAlign(param1: String): void {
        this.eagerAttributes.horizontalAlign = param1;
    }

    public function get verticalAlign(): String {
        return !!this.lazyAttributes ? this.lazyAttributes.verticalAlign : null;
    }

    public function set verticalAlign(param1: String): void {
        this.eagerAttributes.verticalAlign = param1;
    }

    public function get snapToPixel(): Boolean {
        return !!this.lazyAttributes ? this.lazyAttributes.snapToPixel : true;
    }

    public function set snapToPixel(param1: Boolean): void {
        this.eagerAttributes.snapToPixel = param1;
    }

    public function get layoutMode(): String {
        return !!this.lazyAttributes ? this.lazyAttributes.layoutMode : LayoutMode.NONE;
    }

    public function set layoutMode(param1: String): void {
        this.eagerAttributes.layoutMode = param1;
    }

    public function get includeInLayout(): Boolean {
        return !!this.lazyAttributes ? this.lazyAttributes.includeInLayout : true;
    }

    public function set includeInLayout(param1: Boolean): void {
        this.eagerAttributes.includeInLayout = param1;
    }

    public function get x(): Number {
        return !!this.lazyAbsolute ? this.lazyAbsolute.x : NaN;
    }

    public function set x(param1: Number): void {
        this.eagerAbsolute.x = param1;
    }

    public function get y(): Number {
        return !!this.lazyAbsolute ? this.lazyAbsolute.y : NaN;
    }

    public function set y(param1: Number): void {
        this.eagerAbsolute.y = param1;
    }

    public function get width(): Number {
        return !!this.lazyAbsolute ? this.lazyAbsolute.width : NaN;
    }

    public function set width(param1: Number): void {
        this.eagerAbsolute.width = param1;
    }

    public function get height(): Number {
        return !!this.lazyAbsolute ? this.lazyAbsolute.height : NaN;
    }

    public function set height(param1: Number): void {
        this.eagerAbsolute.height = param1;
    }

    public function get percentX(): Number {
        return !!this.lazyRelative ? this.lazyRelative.x : NaN;
    }

    public function set percentX(param1: Number): void {
        this.eagerRelative.x = param1;
    }

    public function get percentY(): Number {
        return !!this.lazyRelative ? this.lazyRelative.y : NaN;
    }

    public function set percentY(param1: Number): void {
        this.eagerRelative.y = param1;
    }

    public function get percentWidth(): Number {
        return !!this.lazyRelative ? this.lazyRelative.width : NaN;
    }

    public function set percentWidth(param1: Number): void {
        this.eagerRelative.width = param1;
    }

    public function get percentHeight(): Number {
        return !!this.lazyRelative ? this.lazyRelative.height : NaN;
    }

    public function set percentHeight(param1: Number): void {
        this.eagerRelative.height = param1;
    }

    public function get left(): Number {
        return !!this.lazyAnchor ? this.lazyAnchor.left : NaN;
    }

    public function set left(param1: Number): void {
        this.eagerAnchor.left = param1;
    }

    public function get top(): Number {
        return !!this.lazyAnchor ? this.lazyAnchor.top : NaN;
    }

    public function set top(param1: Number): void {
        this.eagerAnchor.top = param1;
    }

    public function get right(): Number {
        return !!this.lazyAnchor ? this.lazyAnchor.right : NaN;
    }

    public function set right(param1: Number): void {
        this.eagerAnchor.right = param1;
    }

    public function get bottom(): Number {
        return !!this.lazyAnchor ? this.lazyAnchor.bottom : NaN;
    }

    public function set bottom(param1: Number): void {
        this.eagerAnchor.bottom = param1;
    }

    public function get paddingLeft(): Number {
        return !!this.lazyPadding ? this.lazyPadding.left : NaN;
    }

    public function set paddingLeft(param1: Number): void {
        this.eagerPadding.left = param1;
    }

    public function get paddingTop(): Number {
        return !!this.lazyPadding ? this.lazyPadding.top : NaN;
    }

    public function set paddingTop(param1: Number): void {
        this.eagerPadding.top = param1;
    }

    public function get paddingRight(): Number {
        return !!this.lazyPadding ? this.lazyPadding.right : NaN;
    }

    public function set paddingRight(param1: Number): void {
        this.eagerPadding.right = param1;
    }

    public function get paddingBottom(): Number {
        return !!this.lazyPadding ? this.lazyPadding.bottom : NaN;
    }

    public function set paddingBottom(param1: Number): void {
        this.eagerPadding.bottom = param1;
    }

    override public function toString(): String {
        return "abs [" + this.x + ", " + this.y + ", " + this.width + ", " + this.height + "] " + "rel [" + this.percentX + ", " + this.percentY + ", " + this.percentWidth + ", " + this.percentHeight + "] " + "anch (" + this.left + ", " + this.top + ")(" + this.right + ", " + this.bottom + ") " + "pad [" + this.paddingLeft + ", " + this.paddingTop + ", " + this.paddingRight + ", " + this.paddingBottom + "] " + "layoutMode: " + this.layoutMode + " " + "index: " + this.index + " " + "scale: " + this.scaleMode + " " + "valign: " + this.verticalAlign + " " + "halign: " + this.horizontalAlign + " " + "snap: " + this.snapToPixel;
    }

    override public function get synthesizer(): MetadataSynthesizer {
        return SYNTHESIZER;
    }

    private function get lazyAttributes(): LayoutAttributesMetadata {
        return getValue(MetadataNamespaces.LAYOUT_ATTRIBUTES) as LayoutAttributesMetadata;
    }

    private function get eagerAttributes(): LayoutAttributesMetadata {
        var _loc1_: LayoutAttributesMetadata = this.lazyAttributes;
        if (_loc1_ == null) {
            _loc1_ = new LayoutAttributesMetadata();
            addValue(MetadataNamespaces.LAYOUT_ATTRIBUTES, _loc1_);
        }
        return _loc1_;
    }

    private function get lazyAbsolute(): AbsoluteLayoutMetadata {
        return getValue(MetadataNamespaces.ABSOLUTE_LAYOUT_PARAMETERS) as AbsoluteLayoutMetadata;
    }

    private function get eagerAbsolute(): AbsoluteLayoutMetadata {
        var _loc1_: AbsoluteLayoutMetadata = this.lazyAbsolute;
        if (_loc1_ == null) {
            _loc1_ = new AbsoluteLayoutMetadata();
            addValue(MetadataNamespaces.ABSOLUTE_LAYOUT_PARAMETERS, _loc1_);
        }
        return _loc1_;
    }

    private function get lazyRelative(): RelativeLayoutMetadata {
        return getValue(MetadataNamespaces.RELATIVE_LAYOUT_PARAMETERS) as RelativeLayoutMetadata;
    }

    private function get eagerRelative(): RelativeLayoutMetadata {
        var _loc1_: RelativeLayoutMetadata = this.lazyRelative;
        if (_loc1_ == null) {
            _loc1_ = new RelativeLayoutMetadata();
            addValue(MetadataNamespaces.RELATIVE_LAYOUT_PARAMETERS, _loc1_);
        }
        return _loc1_;
    }

    private function get lazyAnchor(): AnchorLayoutMetadata {
        return getValue(MetadataNamespaces.ANCHOR_LAYOUT_PARAMETERS) as AnchorLayoutMetadata;
    }

    private function get eagerAnchor(): AnchorLayoutMetadata {
        var _loc1_: AnchorLayoutMetadata = this.lazyAnchor;
        if (_loc1_ == null) {
            _loc1_ = new AnchorLayoutMetadata();
            addValue(MetadataNamespaces.ANCHOR_LAYOUT_PARAMETERS, _loc1_);
        }
        return _loc1_;
    }

    private function get lazyPadding(): PaddingLayoutMetadata {
        return getValue(MetadataNamespaces.PADDING_LAYOUT_PARAMETERS) as PaddingLayoutMetadata;
    }

    private function get eagerPadding(): PaddingLayoutMetadata {
        var _loc1_: PaddingLayoutMetadata = this.lazyPadding;
        if (_loc1_ == null) {
            _loc1_ = new PaddingLayoutMetadata();
            addValue(MetadataNamespaces.PADDING_LAYOUT_PARAMETERS, _loc1_);
        }
        return _loc1_;
    }
}
}
