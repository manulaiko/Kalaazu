package package_33
{
   import com.bigpoint.utils.class_122;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.gui.class_58;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_105.class_282;
   import package_30.class_130;
   import package_30.class_91;
   import package_39.class_1052;
   import package_39.class_1053;
   import package_72.class_190;
   import package_9.ResourceManager;
   import package_9.class_50;
   
   public class class_183 extends class_93
   {
       
      
      private var var_2135:DisplayObject;
      
      public function class_183(param1:class_58, param2:int)
      {
         super(param1,param2);
      }
      
      public function method_4345(param1:int, param2:String) : void
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         while(_loc3_ < elements.length)
         {
            if((_loc4_ = elements[_loc3_]) is class_130)
            {
               if(class_130(_loc4_).getID() == param1)
               {
                  class_130(_loc4_).setText(param2);
               }
            }
            _loc3_++;
         }
      }
      
      public function method_1002() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         while(_loc1_ < elements.length)
         {
            _loc2_ = elements[_loc1_];
            if(_loc2_ is class_130)
            {
               class_130(_loc2_).updateView();
            }
            _loc1_++;
         }
      }
      
      public function updateInfoField(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:Number = NaN;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc33_:Number = NaN;
         var _loc34_:int = 0;
         var _loc35_:* = null;
         var _loc36_:Boolean = false;
         var _loc37_:* = null;
         var _loc38_:Number = NaN;
         var _loc39_:Number = NaN;
         var _loc40_:* = null;
         var _loc4_:int = 0;
         for(; _loc4_ < elements.length; _loc4_++)
         {
            if(!((_loc5_ = elements[_loc4_]) is class_130))
            {
               continue;
            }
            if((_loc6_ = _loc5_ as class_130).getID() != param1)
            {
               continue;
            }
            switch(param1)
            {
               case class_91.const_2130:
                  _loc8_ = 0;
                  _loc6_.method_2518(_loc8_.toString());
                  _loc6_.setText(_loc8_.toString(),false);
                  break;
               case class_91.const_744:
                  if(this.map != null)
                  {
                     if((_loc7_ = this.map.hero) != null)
                     {
                        _loc26_ = Number(_loc7_.hp.hp.value);
                        _loc27_ = Number(_loc7_.hp.const_3026.value);
                        _loc6_.method_2518(class_122.method_98(_loc26_));
                        _loc6_.setText(class_122.method_98(_loc26_) + class_130.var_904 + class_122.method_98(_loc27_));
                        _loc6_.method_4984(_loc26_,_loc27_);
                        if(guiManager.method_1262(class_91.const_744))
                        {
                           _loc6_.method_5900(guiManager.method_1262(class_91.const_744).var_3041);
                        }
                     }
                  }
                  break;
               case class_91.const_684:
                  if(this.map != null)
                  {
                     if((_loc7_ = this.map.hero) != null)
                     {
                        _loc28_ = int(_loc7_.hp.const_2381.value);
                        _loc29_ = int(_loc7_.hp.const_805.value);
                        _loc6_.method_2518(class_122.method_98(_loc28_));
                        _loc6_.setText(class_122.method_98(_loc28_) + class_130.var_904 + class_122.method_98(_loc29_));
                        if(_loc29_ > 0)
                        {
                           _loc6_.method_4984(_loc28_,_loc29_);
                        }
                        else
                        {
                           _loc6_.method_4984(_loc28_,1);
                        }
                        if(guiManager.method_1262(class_91.const_684))
                        {
                           _loc6_.method_5900(guiManager.method_1262(class_91.const_684).var_3041);
                        }
                     }
                  }
                  break;
               case class_91.const_281:
                  if(this.map != null)
                  {
                     if((_loc7_ = this.map.hero) != null)
                     {
                        _loc30_ = Number(_loc7_.hp.shield.value);
                        if((_loc31_ = Number(_loc7_.hp.maxShield.value)) == 0 && Boolean(_loc6_.visible))
                        {
                           _loc6_.visible = false;
                        }
                        else if(_loc31_ != 0 && !_loc6_.visible)
                        {
                           _loc6_.visible = true;
                        }
                        _loc6_.method_2518(class_122.method_98(_loc30_));
                        _loc6_.setText(class_122.method_98(_loc30_) + class_130.var_904 + class_122.method_98(_loc31_));
                        if(_loc31_ > 0)
                        {
                           _loc6_.method_4984(_loc30_,_loc31_);
                        }
                        else
                        {
                           _loc6_.method_4984(_loc30_,1);
                        }
                        if(guiManager.method_1262(class_91.const_281))
                        {
                           _loc6_.method_5900(guiManager.method_1262(class_91.const_281).var_3041);
                        }
                     }
                  }
                  break;
               case class_91.const_1274:
                  if(this.map != null)
                  {
                     if((_loc7_ = this.map.hero) != null)
                     {
                        _loc32_ = Number(class_81.const_934.value);
                        _loc33_ = Number(class_81.const_227.value);
                        _loc6_.method_2518(class_122.method_98(_loc32_));
                        _loc6_.setText(class_122.method_98(_loc32_) + class_130.var_904 + class_122.method_98(_loc33_));
                        _loc6_.method_4984(_loc32_,_loc33_);
                        if(guiManager.method_1262(class_91.const_1274))
                        {
                           _loc6_.method_5900(guiManager.method_1262(class_91.const_1274).var_3041);
                        }
                     }
                  }
                  break;
               case class_91.const_1281:
                  _loc6_.method_2518(class_122.method_98(class_81.var_3630));
                  break;
               case class_91.const_1115:
                  _loc9_ = 0;
                  _loc6_.method_2518(class_122.method_98(_loc9_));
                  _loc6_.setText(class_122.method_98(_loc9_));
                  break;
               case class_91.const_1329:
                  _loc10_ = 0;
                  _loc6_.method_2518(class_122.method_98(_loc10_));
                  _loc6_.setText(class_122.method_98(_loc10_));
                  break;
               case class_91.const_692:
                  _loc11_ = 0;
                  _loc12_ = false ? 0 : 0;
                  _loc13_ = false ? 0 : 0;
                  _loc14_ = false ? 0 : 0;
                  _loc15_ = _loc11_ + _loc12_ + _loc13_ + _loc14_;
                  _loc16_ = String(_loc15_);
                  _loc6_.method_2518(_loc16_);
                  _loc17_ = String(_loc11_);
                  if(_loc12_ > 0 || _loc13_ > 0 || _loc14_ > 0)
                  {
                     _loc6_.languageKey = "ttip_booty-key-green";
                     if(_loc12_ > 0)
                     {
                        _loc17_ += "\n" + class_88.getItem("ttip_booty-key-blue").replace(/%AMOUNT%/,String(_loc12_));
                     }
                     if(_loc13_ > 0)
                     {
                        _loc17_ += "\n" + class_88.getItem("ttip_booty-key-red").replace(/%AMOUNT%/,String(_loc13_));
                     }
                     if(_loc14_ > 0)
                     {
                        _loc17_ += "\n" + class_88.getItem("ttip_booty-key-silver").replace(/%AMOUNT%/,String(_loc14_));
                     }
                  }
                  else
                  {
                     _loc6_.languageKey = "ttip_booty-key";
                  }
                  _loc6_.setText(_loc17_,false);
                  break;
               case class_91.const_2410:
                  _loc18_ = 0;
                  _loc6_.method_2518(class_122.method_98(_loc18_));
                  _loc6_.setText(class_122.method_98(_loc18_),false);
                  break;
               case class_91.const_1026:
                  _loc19_ = 0;
                  _loc6_.method_2518(class_122.round(_loc19_,2));
                  _loc6_.setText(class_122.round(_loc19_,2));
                  break;
               case class_91.const_1371:
                  _loc20_ = 0;
                  _loc6_.method_2518(class_122.method_98(_loc20_));
                  _loc6_.setText(class_122.method_98(_loc20_));
                  break;
               case class_91.const_2295:
                  _loc21_ = 0;
                  _loc6_.method_2518(class_122.method_98(_loc21_));
                  _loc6_.setText(class_122.method_98(_loc21_));
                  break;
               case class_91.const_2982:
                  _loc22_ = 0;
                  _loc6_.method_2518(_loc22_.toString());
                  _loc6_.setText(_loc22_.toString(),false);
                  break;
               case class_91.const_1504:
                  _loc2_ = int(class_81.var_121.var_3003);
                  _loc3_ = class_81.var_121.var_3580[_loc2_];
                  if(_loc3_ != null)
                  {
                     _loc34_ = int(_loc3_.var_3850);
                     _loc6_.method_2518(class_122.method_98(_loc34_));
                     if(_loc3_.name_94 != null)
                     {
                        _loc6_.updateTooltip(class_88.getItem(_loc6_.languageKey) + "\n" + _loc3_.name_94);
                     }
                     if(_loc3_.targetList != null)
                     {
                        if(_loc3_.targetList.length > 1 || _loc3_.var_99 == class_282.const_594)
                        {
                           _loc35_ = ResourceManager.getBitmap("ui","rankedHuntIcon_" + class_126.getInstance().method_4980[_loc3_.var_99]);
                        }
                        else
                        {
                           _loc35_ = ResourceManager.getBitmap("ui","rankedHuntIcon_npc" + _loc3_.targetList[0]);
                        }
                        if(_loc35_ != null)
                        {
                           _loc6_.method_467(_loc35_);
                        }
                     }
                  }
                  break;
               case class_91.const_840:
                  _loc2_ = int(class_81.var_121.var_3003);
                  _loc3_ = class_81.var_121.var_3580[_loc2_];
                  if(_loc3_ != null)
                  {
                     _loc36_ = true;
                     if(_loc3_.var_1443)
                     {
                        _loc6_.setColor(15580416);
                        _loc36_ = false;
                     }
                     else
                     {
                        _loc6_.setColor(int(class_18.const_1147.color));
                        _loc36_ = _loc36_;
                     }
                     if(_loc36_)
                     {
                        _loc6_.setText(class_88.getItem("ttip_clan_bounty_points_updated_in_5_minute_cycle"));
                     }
                     _loc6_.getChildByName("CLOCK_ICON").visible = _loc36_;
                     _loc6_.method_2518(class_122.method_98(_loc3_.var_1138));
                  }
                  break;
               case class_91.const_1354:
                  _loc23_ = int(class_81.var_3085.name_11);
                  _loc6_.method_4394(_loc23_);
                  break;
               case class_91.const_948:
                  _loc24_ = int(class_81.var_3085.points);
                  _loc6_.method_2518(class_122.method_98(_loc24_));
                  break;
               case class_91.const_2921:
                  _loc25_ = int(class_81.var_3085.var_4573);
                  _loc6_.method_2518(class_122.method_98(_loc25_));
                  break;
               case class_91.const_1436:
                  if(this.var_2135)
                  {
                     _loc37_ = this.var_2135 as class_1052;
                     _loc38_ = class_81.var_918.name_91 - 1;
                     _loc39_ = class_81.var_918.var_297 - 1;
                     _loc37_.update(_loc38_,_loc39_);
                     _loc37_.method_3662(class_81.var_918.name_91);
                     if(_loc38_ > 0)
                     {
                        _loc37_.method_5417(3);
                     }
                  }
                  break;
               case class_91.const_276:
                  if(this.var_2135)
                  {
                     (_loc40_ = this.var_2135 as class_1052).var_4659 = class_81.var_918.var_3914;
                     _loc40_.update(class_81.var_918.var_3111,class_81.var_918.var_4813);
                     if(class_81.var_918.var_3111 > 0)
                     {
                        _loc40_.method_5417(1,0.5);
                        _loc40_.method_4394(class_81.var_918.var_3111);
                     }
                  }
                  break;
               case class_91.const_24:
                  if(this.var_2135)
                  {
                     (this.var_2135 as class_1053).method_4656(class_81.var_918.var_2253,class_81.var_918.var_392);
                  }
                  break;
               case class_91.const_2260:
                  _loc6_.method_2518(class_122.method_98(class_81.var_918.points));
                  break;
            }
         }
      }
      
      public function get component() : DisplayObject
      {
         return this.var_2135;
      }
      
      public function set component(param1:DisplayObject) : void
      {
         this.var_2135 = param1;
         if(!this.contains(this.var_2135))
         {
            this.addChild(this.var_2135);
         }
      }
      
      private function get map() : class_90
      {
         return class_50.getInstance().map;
      }
   }
}
