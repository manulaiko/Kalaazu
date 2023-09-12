package package_449 {

import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.fui.builder.repository.TextStyleRepository;
import net.bigpoint.darkorbit.fui.builder.repository.TextStyleVO;

public class class_2672 {

    public static const const_2847: String = "EurostileT";

    public static const const_3107: TextFormat = new TextFormat(const_2847, 9, 16777215, null, null, null, null, null, TextFormatAlign.CENTER);

    public static const const_2882: TextFormat = new TextFormat(const_2847, 12, 11461375);


    public function class_2672() {
        super();
    }

    public static function init(): void {
        var _loc1_: TextStyleVO = new TextStyleVO("hintsystem_overview_itemlist");
        _loc1_.textFormat = const_2882;
        _loc1_.embedFonts = class_18.var_3911;
        _loc1_.multiline = false;
        _loc1_.wordWrap = false;
        _loc1_.selectable = false;
        _loc1_.autoSize = TextFieldAutoSize.LEFT;
        _loc1_.border = false;
        var _loc2_: TextStyleVO = new TextStyleVO("hintsystem_overview_archivebutton");
        _loc2_.textFormat = const_3107;
        _loc2_.embedFonts = class_18.var_3911;
        _loc2_.multiline = false;
        _loc2_.wordWrap = true;
        _loc2_.selectable = false;
        _loc2_.autoSize = TextFieldAutoSize.CENTER;
        _loc2_.border = false;
        var _loc3_: TextStyleRepository = TextStyleRepository.getInstance();
        _loc3_.register(_loc1_);
        _loc3_.register(_loc2_);
    }
}
}
