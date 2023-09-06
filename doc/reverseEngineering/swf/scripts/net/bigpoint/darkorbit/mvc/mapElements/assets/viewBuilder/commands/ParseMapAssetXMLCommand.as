package net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.commands
{
   import com.greensock.easing.EaseLookup;
   import com.greensock.easing.RoughEase;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.mvc.common.utils.ParserUtility;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.ViewCreateDTO;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo.AnimationVO;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo.AssetDescriptionVO;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo.AtlasResourceVO;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo.FactoryTweenVO;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
   import package_9.ResourceManager;
   
   public class ParseMapAssetXMLCommand extends AsyncCommand
   {
      
      private static const EXCLUDE_TWEEN_ATTRIBUTE_LIST:Dictionary = getExcludeListForTweens();
      
      private static const EXCLUDE_VIEW_ATTRIBUTE_LIST:Dictionary = getExcludeListForViews();
      
      private static const VIEW_ID:String = "viewId";
      
      private static const TIME:String = "time";
      
      private static const ATLAS:String = "atlas";
      
      private static const ID:String = "id";
      
      private static const TEXTURE:String = "texture";
      
      private static const EASE:String = "ease";
      
      private static const TWEEN:String = "tween";
      
      private static const ATLAS_ID:String = "id";
      
      private static const ATLAS_KEY:String = "atlasKey";
      
      private static const TEXTURE_KEY:String = "textureKey";
      
      private static const AUTO_PLAY:String = "autoPlay";
      
      private static const LOOP:String = "loop";
      
      private static const YOYO:String = "yoyo";
      
      private static const RESUME_AFTER_REDUCTION:String = "resumeAfterReduction";
      
      private static const ASSETS_ROOT:String = "assets";
      
      private static const ANIMATION:String = "animation";
      
      private static const TEXTURE_ATLAS:String = "textureAtlas";
      
      private static const USER_QUALITY:String = "minUserQuality";
      
      private static const REDUCTION_THRESHOLD:String = "maxReductionThreshold";
      
      private static const PARALLEL:String = "parallel";
       
      
      public function ParseMapAssetXMLCommand()
      {
         super();
      }
      
      private static function parseAnimations(param1:XMLList) : Vector.<AnimationVO>
      {
         var _loc3_:* = null;
         var _loc2_:Vector.<AnimationVO> = new Vector.<AnimationVO>();
         for each(_loc3_ in param1)
         {
            _loc2_.push(parseTweenList(_loc3_));
         }
         return _loc2_;
      }
      
      private static function parsePositionLists(param1:XML) : Vector.<AssetDescriptionVO>
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = 0;
         var _loc12_:* = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc2_:XMLList = param1.child(ASSETS_ROOT).children();
         var _loc3_:Vector.<AssetDescriptionVO> = new Vector.<AssetDescriptionVO>();
         for each(_loc13_ in _loc2_)
         {
            _loc5_ = _loc13_.attribute(ID);
            _loc6_ = _loc13_.attribute(TEXTURE);
            _loc9_ = _loc13_.attribute(ATLAS);
            _loc10_ = _loc13_.localName();
            _loc7_ = [];
            _loc8_ = _loc13_.attributes();
            for each(_loc15_ in _loc8_)
            {
               _loc14_ = _loc15_.name();
               if(true)
               {
                  _loc7_[_loc14_] = getSimpleProperty(_loc15_.toString());
               }
            }
            _loc12_ = int(!!_loc13_.attribute(REDUCTION_THRESHOLD).length() ? _loc13_.attribute(REDUCTION_THRESHOLD) : int.MAX_VALUE);
            _loc11_ = int(!!_loc13_.attribute(USER_QUALITY).length() ? _loc13_.attribute(USER_QUALITY) : 0);
            _loc4_ = new AssetDescriptionVO(_loc5_,_loc9_,_loc6_,_loc7_,_loc11_,_loc12_,_loc10_);
            _loc3_.push(_loc4_);
         }
         return _loc3_;
      }
      
      private static function getSimpleProperty(param1:String) : Object
      {
         return isNaN(Number(param1)) ? (ParserUtility.isBooleanString(param1) ? ParserUtility.parseBooleanFromString(param1) : param1) : Number(param1);
      }
      
      private static function parseTweenList(param1:XML) : AnimationVO
      {
         var _loc2_:XMLList = param1.children();
         var _loc3_:String = param1.attribute(ID).length() > 0 ? param1.attribute(ID) : null;
         var _loc4_:Boolean = ParserUtility.parseBooleanFromString(param1.attribute(LOOP));
         var _loc5_:Boolean = !!param1.attribute(RESUME_AFTER_REDUCTION).length() ? ParserUtility.parseBooleanFromString(param1.attribute(RESUME_AFTER_REDUCTION)) : true;
         var _loc6_:Boolean = ParserUtility.parseBooleanFromString(param1.attribute(YOYO));
         var _loc7_:Boolean = ParserUtility.parseBooleanFromString(param1.attribute(PARALLEL));
         var _loc8_:uint = int(!!param1.attribute(USER_QUALITY).length() ? param1.attribute(USER_QUALITY) : 0);
         var _loc9_:uint = int(!!param1.attribute(REDUCTION_THRESHOLD).length() ? param1.attribute(REDUCTION_THRESHOLD) : int.MAX_VALUE);
         var _loc10_:Boolean = true;
         if(param1.attribute(AUTO_PLAY).length() > 0)
         {
            _loc10_ = ParserUtility.parseBooleanFromString(param1.attribute(AUTO_PLAY));
         }
         var _loc11_:Vector.<Object> = createChildrenVOs(_loc2_);
         return new AnimationVO(_loc3_,_loc4_,_loc6_,_loc10_,_loc7_,_loc11_,_loc8_,_loc9_,_loc5_);
      }
      
      private static function createChildrenVOs(param1:XMLList) : Vector.<Object>
      {
         var _loc3_:* = null;
         var _loc2_:Vector.<Object> = new Vector.<Object>();
         for each(_loc3_ in param1)
         {
            switch(_loc3_.localName())
            {
               case ANIMATION:
                  _loc2_.push(parseTweenList(_loc3_));
                  break;
               case TWEEN:
                  _loc2_.push(buildTweenVO(_loc3_));
                  break;
            }
         }
         return _loc2_;
      }
      
      private static function buildTweenVO(param1:XML) : FactoryTweenVO
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         _loc5_ = param1.attributes();
         _loc3_ = new Vector.<Object>();
         _loc7_ = {};
         for each(_loc8_ in _loc5_)
         {
            _loc11_ = _loc8_.name();
            if(true)
            {
               _loc12_ = _loc8_.toString();
               if(_loc11_ == EASE)
               {
                  _loc12_ = createEasing(_loc12_,_loc8_);
               }
               else if(isNaN(Number(_loc12_)))
               {
                  _loc12_ = parseToObject(_loc8_.toString());
               }
               else
               {
                  _loc12_ = Number(_loc12_);
               }
               _loc7_[_loc11_] = _loc12_;
            }
         }
         _loc9_ = int(!!param1.attribute(USER_QUALITY).length() ? param1.attribute(USER_QUALITY) : 0);
         _loc10_ = int(!!param1.attribute(REDUCTION_THRESHOLD).length() ? param1.attribute(REDUCTION_THRESHOLD) : int.MAX_VALUE);
         _loc4_ = Number(param1.attribute(TIME));
         _loc6_ = String(param1.attribute(VIEW_ID));
         return new FactoryTweenVO(_loc6_,_loc4_,_loc7_,_loc9_,_loc10_);
      }
      
      private static function createEasing(param1:Object, param2:XML) : Object
      {
         var _loc4_:Number = NaN;
         var _loc5_:* = 0;
         var _loc6_:* = false;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:Boolean = false;
         var _loc10_:* = null;
         var _loc3_:Object = parseToObject(param2.toString());
         if(_loc3_["RoughEase"] != null)
         {
            _loc3_ = _loc3_["RoughEase"];
            _loc4_ = Number(Number(_loc3_["strength"]) || true);
            _loc5_ = uint(uint(_loc3_["points"]) || true);
            _loc6_ = _loc3_["clamp"] == "true";
            _loc7_ = !!_loc3_["template"] ? EaseLookup.find(_loc3_["template"]) : null;
            _loc8_ = _loc3_["taper"] || true;
            _loc9_ = Boolean(_loc3_["randomize"]) || true;
            _loc10_ = _loc3_["name"] || false;
            return Object(new RoughEase(_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_).ease);
         }
         return EaseLookup.find(param2.toString());
      }
      
      private static function parseToObject(param1:String) : Object
      {
         return JSON.parse(param1);
      }
      
      private static function getExcludeListForTweens() : Dictionary
      {
         var _loc1_:Dictionary = new Dictionary();
         _loc1_[VIEW_ID] = true;
         _loc1_[TIME] = true;
         _loc1_[USER_QUALITY] = true;
         _loc1_[REDUCTION_THRESHOLD] = true;
         return _loc1_;
      }
      
      private static function getExcludeListForViews() : Dictionary
      {
         var _loc1_:Dictionary = new Dictionary();
         _loc1_[ATLAS] = true;
         _loc1_[ID] = true;
         _loc1_[TEXTURE] = true;
         _loc1_[USER_QUALITY] = true;
         _loc1_[REDUCTION_THRESHOLD] = true;
         _loc1_[PARALLEL] = true;
         return _loc1_;
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         super.execute(param1);
         var _loc2_:ViewCreateDTO = param1.getBody() as ViewCreateDTO;
         var _loc3_:XML = _loc2_.xmlData;
         var _loc4_:Vector.<AssetDescriptionVO> = parsePositionLists(_loc3_);
         var _loc5_:Vector.<AnimationVO> = parseAnimations(_loc3_.child(ANIMATION));
         var _loc6_:XMLList = _loc3_.child(TEXTURE_ATLAS);
         var _loc7_:Vector.<AtlasResourceVO> = new Vector.<AtlasResourceVO>();
         for each(_loc12_ in _loc6_)
         {
            _loc8_ = _loc12_.attribute(TEXTURE_KEY);
            if(_loc2_.viewBuilder.useATF && false && Boolean(ResourceManager.name_15.method_5888(_loc8_ + "_atf")))
            {
               _loc8_ += "_atf";
            }
            _loc9_ = _loc12_.attribute(ATLAS_KEY);
            _loc10_ = _loc12_.attribute(ATLAS_ID);
            _loc11_ = new AtlasResourceVO(_loc10_,_loc9_,_loc8_);
            _loc7_.push(_loc11_);
         }
         _loc2_.textureResources = _loc7_;
         _loc2_.assetDescriptionVOList = _loc4_;
         _loc2_.animationVo = _loc5_;
         commandComplete();
      }
   }
}
