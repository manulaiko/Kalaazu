package package_270
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.mvc.common.utils.ParserUtility;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_11.class_262;
   import package_133.class_1853;
   import package_84.class_243;
   
   public class HandelMoodAssetsDestributionCommand extends class_243
   {
       
      
      public function HandelMoodAssetsDestributionCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:class_1853 = param1.getBody() as class_1853;
         if(_loc2_.isActive)
         {
            assetsProxy.loadAndCall(_loc2_.method_5705,this.handleLoaded,[_loc2_]);
         }
      }
      
      private function handleLoaded(param1:class_1853) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:class_262 = assetsProxy.getLib(param1.method_5705) as class_262;
         if(_loc2_)
         {
            _loc3_ = this.method_6285(_loc2_.method_4925(),param1.name_160);
            for each(_loc4_ in _loc3_)
            {
               this.method_4241(_loc4_);
            }
         }
      }
      
      private function method_4241(param1:SpringFightMapAssetCreateVo) : void
      {
      }
      
      private function method_6285(param1:XML, param2:Vector.<String>) : Vector.<SpringFightMapAssetCreateVo>
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc3_:Vector.<SpringFightMapAssetCreateVo> = new Vector.<SpringFightMapAssetCreateVo>();
         var _loc4_:int = !true ? int(name_47.map.method_1480()) : Settings.mapID;
         var _loc8_:int = param2.length;
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_)
         {
            _loc7_ = param2[_loc9_];
            _loc10_ = param1.child("map");
            for each(_loc11_ in _loc10_)
            {
               if(int(_loc11_.attribute("id")) == _loc4_)
               {
                  for each(_loc12_ in _loc11_.child("layer"))
                  {
                     if(String(_loc12_.attribute("id")) == _loc7_)
                     {
                        _loc5_ = int(_loc12_.attribute("pfac"));
                        _loc6_ = int(_loc12_.attribute("index"));
                        _loc10_ = param1.child("asset");
                        _loc13_ = !true ? int(name_47.map.method_5076) : int(class_90.const_2663);
                        _loc14_ = !true ? int(name_47.map.method_1901) : int(class_90.const_927);
                        for each(_loc16_ in _loc10_)
                        {
                           if(String(_loc16_.attribute("id")) == _loc7_)
                           {
                              _loc15_ = ParserUtility.parsePointLiteNumbers(_loc16_);
                              _loc15_.x *= _loc13_;
                              _loc15_.y *= _loc14_;
                              _loc3_.push(new SpringFightMapAssetCreateVo(String(_loc16_.attribute("xmlResKey")),_loc15_,_loc5_,_loc6_));
                           }
                        }
                     }
                  }
               }
            }
            _loc9_++;
         }
         return _loc3_;
      }
   }
}

import com.bigpoint.utils.class_73;

class SpringFightMapAssetCreateVo
{
    
   
   private var _xmlResKey:String;
   
   private var _pointLite:class_73;
   
   private var _pfac:int;
   
   private var _layer:int;
   
   function SpringFightMapAssetCreateVo(param1:String, param2:class_73, param3:int, param4:int)
   {
      super();
      this._layer = param4;
      this._pfac = param3;
      this._pointLite = param2;
      this._xmlResKey = param1;
   }
   
   public function get xmlResKey() : String
   {
      return this._xmlResKey;
   }
   
   public function get pointLite() : class_73
   {
      return this._pointLite;
   }
   
   public function get pfac() : int
   {
      return this._pfac;
   }
   
   public function get layer() : int
   {
      return this._layer;
   }
}
