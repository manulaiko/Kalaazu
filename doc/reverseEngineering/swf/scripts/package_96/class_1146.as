package package_96 {

import com.bigpoint.utils.class_122;
import com.bigpoint.utils.class_1469;

import flash.display.Bitmap;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.mvc.common.utils.MessageReplacementUtil;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.IResultWindowMediator;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.control.ResultHeaderCommandBase;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.model.StatsHeaderLableTweenVo;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.view.tweens.StdBackgroundTween;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.view.tweens.StdHideTween;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.view.tweens.StdOverLayTween;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.view.tweens.StdTextureTween;
import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;
import net.bigpoint.darkorbit.mvc.mapElements.common.model.assetProxy.MapAssetLoadVo;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_127.class_356;

import package_151.class_1511;
import package_151.class_1515;
import package_151.class_989;
import package_151.class_995;

import package_152.class_990;

import package_277.TDMResultWindowMediator;

import package_38.class_439;
import package_38.class_460;
import package_38.class_563;
import package_38.class_601;
import package_38.class_682;

import package_76.class_1110;

import package_83.TDMStatusNotification;

import package_92.TDMResultWindowNotifications;
import package_92.class_996;

public class class_1146 extends ResultHeaderCommandBase {


    public function class_1146() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: TDMResultWindowMediator = facade.retrieveMediator(TDMResultWindowMediator.NAME) as TDMResultWindowMediator;
        var _loc3_: class_460 = param1.getBody() as class_460;
        var _loc4_: Vector.<class_995> = this.method_6159(_loc3_);
        var _loc5_: class_989 = this.method_5198(_loc3_);
        var _loc6_: String = this.method_126(_loc3_.name_122);
        var _loc7_: class_990 = new class_990(_loc4_, _loc5_, _loc6_);
        initHeaderLable(_loc3_.var_2457, _loc2_);
        _loc2_.title = class_88.getItem("tdm_result_window_statistics_title");
        sendNotification(TDMResultWindowNotifications.SET_DATA, _loc7_);
        sendNotification(TDMStatusNotification.CLEANUP);
    }

    private function method_5198(param1: class_460): class_989 {
        var _loc5_: * = null;
        var _loc7_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc2_: Vector.<class_1511> = new Vector.<class_1511>();
        var _loc3_: Vector.<class_563> = param1.rewards;
        var _loc4_: int = _loc3_.length;
        var _loc6_: class_126 = class_126.getInstance();
        var _loc8_: int = 0;
        while (_loc8_ < _loc4_) {
            _loc5_ = !!(_loc7_ = _loc6_.var_2033[_loc3_[_loc8_].lootId] as class_356) ? _loc7_.name : _loc3_[_loc8_].lootId;
            _loc2_.push(new class_1511(_loc5_, class_122.method_98(_loc3_[_loc8_].amount)));
            _loc8_++;
        }
        var _loc9_: int = int(param1.var_1071);
        var _loc10_: int = int(param1.var_596);
        if (_loc2_.length > 0) {
            _loc12_ = "null";
            _loc11_ = class_88.getItem(class_996.const_85);
        } else {
            _loc12_ = "null";
            _loc11_ = "";
        }
        _loc5_ = (_loc5_ = class_88.getItem(_loc12_)).replace(/%KILLS%/, _loc9_).replace(/%DEATHS%/, _loc10_);
        _loc11_ = _loc11_.replace(/%KILLS%/, _loc9_).replace(/%DEATHS%/, _loc10_);
        return new class_989(_loc2_, _loc5_, _loc11_);
    }

    private function method_6159(param1: class_460): Vector.<class_995> {
        var _loc2_: Vector.<class_995> = new Vector.<class_995>();
        _loc2_.push(this.method_1266(param1.var_3432, param1.var_4243));
        _loc2_.push(this.method_1266(param1.var_4019, param1.var_3014));
        return _loc2_;
    }

    private function method_1266(param1: Vector.<class_682>, param2: class_439): class_995 {
        var _loc3_: Vector.<class_1515> = new Vector.<class_1515>();
        var _loc4_: int = param1.length;
        var _loc5_: int = 0;
        while (_loc5_ < _loc4_) {
            _loc3_.push(this.method_1504(param1[_loc5_]));
            _loc5_++;
        }
        return new class_995(class_126.getInstance().method_2276[param2.faction], param2.faction, _loc3_);
    }

    private function method_1504(param1: class_682): class_1515 {
        return new class_1515(this.method_1660(param1), this.method_2169(param1), this.method_5662(param1), this.method_1206(param1), this.method_2132(param1), this.method_1295(param1), this.method_5003(param1));
    }

    private function method_1660(param1: class_682): class_1469 {
        return new class_1469(param1.name, param1.var_4057.toString());
    }

    private function method_5003(param1: class_682): class_1469 {
        return new class_1469(class_1110.method_5670(class_996.const_3178, class_88.getItem("result_window_winning_streak_lable")), this.method_1499(param1.var_4590));
    }

    private function method_1295(param1: class_682): class_1469 {
        return new class_1469(class_1110.method_5670(class_996.const_3178, class_88.getItem("jackpot_result_window_peak_damage_lable")), this.method_1499(param1.var_315));
    }

    private function method_2132(param1: class_682): class_1469 {
        return new class_1469(class_1110.method_5670(class_996.const_3178, class_88.getItem("jackpot_result_window_damage_taken_lable")), this.method_1499(param1.var_3680));
    }

    private function method_1206(param1: class_682): class_1469 {
        return new class_1469(class_1110.method_5670(class_996.const_3178, class_88.getItem("jackpot_result_window_damage_given_lable")), this.method_1499(param1.var_2733));
    }

    private function method_5662(param1: class_682): class_1469 {
        return new class_1469(class_1110.method_5670(class_996.const_3178, class_88.getItem("result_window_points_delta")), this.method_1499(param1.var_4057));
    }

    private function method_2169(param1: class_682): class_1469 {
        return new class_1469(class_1110.method_5670(class_996.const_3178, class_88.getItem("result_window_kills") + "/" + class_88.getItem("result_window_death")), class_1110.method_5670(class_996.const_1907, param1.var_739 + "/" + param1.var_4529));
    }

    private function method_1499(param1: int): String {
        var _loc2_: int = param1 >= 0 ? 0 : int(class_996.const_932);
        return class_1110.method_5670(_loc2_, param1.toString());
    }

    override protected function getBgLibName(): String {
        return class_996.name_129;
    }

    override protected function loadTexture(param1: IResultWindowMediator, param2: Object): void {
        var _loc3_: String = this.getTextureKey(param2);
        sendNotification(MapAssetNotification.LOAD_GRAPHICS_FOR_MAPASSET, new MapAssetLoadVo(this.method_847(param2, param1), getEffectLibName(), new <String>[_loc3_], Bitmap));
    }

    private function method_847(param1: Object, param2: IResultWindowMediator): Function {
        return !int(param1) == class_460.WIN ? param2.setTexture : param2.setBackground;
    }

    override protected function getTextureKey(param1: Object): String {
        var _loc2_: * = null;
        switch (int(param1)) {
            case class_460.const_474:
                _loc2_ = "winTexture";
                break;
            case class_460.const_465:
                _loc2_ = "loseTexture";
                break;
            case class_460.WIN:
                _loc2_ = "winTexture";
                break;
            case class_460.const_2658:
                _loc2_ = "loseTexture";
        }
        return _loc2_;
    }

    override protected function getGradientImageKey(param1: Object): String {
        var _loc2_: * = null;
        switch (int(param1)) {
            case class_460.const_474:
                _loc2_ = "loseGradiant";
                break;
            case class_460.const_465:
                _loc2_ = "loseGradiant";
                break;
            case class_460.WIN:
                _loc2_ = "winGradiant";
                break;
            case class_460.const_2658:
                _loc2_ = "loseGradiant";
        }
        return _loc2_;
    }

    override protected function getBGImageKey(param1: Object): String {
        var _loc2_: * = null;
        switch (int(param1)) {
            case class_460.const_474:
                _loc2_ = "drawBackground";
                break;
            case class_460.const_465:
                _loc2_ = "drawPic";
                break;
            case class_460.WIN:
                _loc2_ = "winPic";
                break;
            case class_460.const_2658:
                _loc2_ = "losePic";
        }
        return _loc2_;
    }

    override protected function getTweenSet(param1: Object): StatsHeaderLableTweenVo {
        var _loc2_: StatsHeaderLableTweenVo = new StatsHeaderLableTweenVo();
        switch (int(param1)) {
            case class_460.WIN:
                _loc2_.backGroundTween = new StdBackgroundTween();
                _loc2_.glowTween = new StdOverLayTween();
                _loc2_.textureTween = new StdHideTween();
                break;
            case class_460.const_474:
                _loc2_.backGroundTween = new StdHideTween();
                _loc2_.glowTween = new StdHideTween();
                _loc2_.textureTween = new StdHideTween();
                break;
            case class_460.const_465:
            case class_460.const_2658:
            default:
                _loc2_.backGroundTween = new StdHideTween();
                _loc2_.glowTween = new StdHideTween();
                _loc2_.textureTween = new StdTextureTween();
        }
        return _loc2_;
    }

    override protected function getHeaderText(param1: Object): String {
        var _loc2_: * = null;
        switch (int(param1)) {
            case class_460.const_474:
                _loc2_ = "result_window_header_draw";
                break;
            case class_460.const_465:
                _loc2_ = "result_window_header_no_lifes_left";
                break;
            case class_460.WIN:
                _loc2_ = "jackpot_result_window_header_win";
                break;
            case class_460.const_2658:
                _loc2_ = "jackpot_result_window_header_lose";
        }
        return class_88.getItem(_loc2_);
    }

    private function method_126(param1: class_601): String {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc2_: Array = class_88.getItem("jackpot_result_window_hint_base").split(class_996.const_3021);
        var _loc3_: Vector.<String> = new Vector.<String>();
        for each(_loc4_ in _loc2_) {
            _loc3_.push(class_1110.method_5670(class_996.const_3222, _loc4_));
        }
        _loc5_ = MessageReplacementUtil.repaceAllWithTextKey(param1.var_2377, param1.var_344);
        return _loc3_.join(class_1110.method_5670(class_996.const_3132, _loc5_));
    }
}
}
