package package_447
{
   import flash.text.StyleSheet;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.fui.builder.repository.TextStyleRepository;
   import net.bigpoint.darkorbit.fui.builder.repository.TextStyleVO;
   import package_76.class_1110;
   
   public class class_2669
   {
      
      public static const const_1724:int = 18;
      
      public static const const_407:uint = 15327936;
      
      public static const const_487:TextFormat = new TextFormat(class_18.const_740,const_1724,const_407);
      
      public static const const_988:int = 16;
      
      public static const const_1609:uint = 14610431;
      
      public static const const_1201:TextFormat = new TextFormat(class_18.const_740,const_988,const_1609);
      
      public static const const_1518:int = 15;
      
      public static const const_3054:uint = 11464690;
      
      public static const const_330:TextFormat = new TextFormat("EurostileFl",const_1518,const_3054);
      
      public static const const_1963:int = 16;
      
      public static const const_1356:uint = 16777215;
      
      public static const const_2121:TextFormat = new TextFormat(class_18.const_740,const_1963,const_1356,null,null,null,null,null,TextFormatAlign.CENTER);
       
      
      public function class_2669()
      {
         super();
      }
      
      public static function init() : void
      {
         var _loc1_:TextStyleVO = new TextStyleVO("hintsystem_header");
         _loc1_.textFormat = const_487;
         _loc1_.embedFonts = class_18.var_3911;
         _loc1_.multiline = false;
         _loc1_.wordWrap = false;
         _loc1_.selectable = false;
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         _loc1_.border = false;
         var _loc2_:TextStyleVO = new TextStyleVO("hintsystem_message_header");
         _loc2_.textFormat = const_1201;
         _loc2_.embedFonts = class_18.var_3911;
         _loc2_.wordWrap = true;
         _loc2_.selectable = false;
         _loc2_.autoSize = TextFieldAutoSize.LEFT;
         _loc2_.border = false;
         var _loc3_:Object = {"color":class_1110.method_1252(class_18.YELLOW)};
         var _loc4_:StyleSheet;
         (_loc4_ = new StyleSheet()).setStyle(".yellow",_loc3_);
         var _loc5_:TextStyleVO;
         (_loc5_ = new TextStyleVO("hintsystem_message")).textFormat = const_330;
         _loc5_.embedFonts = class_18.var_3911;
         _loc5_.wordWrap = true;
         _loc5_.multiline = true;
         _loc5_.selectable = false;
         _loc5_.autoSize = TextFieldAutoSize.LEFT;
         _loc5_.border = false;
         _loc5_.styleSheet = _loc4_;
         var _loc6_:TextStyleVO;
         (_loc6_ = new TextStyleVO("hintsystem_confirmation")).textFormat = const_2121;
         _loc6_.embedFonts = class_18.var_3911;
         _loc6_.wordWrap = true;
         _loc6_.multiline = false;
         _loc6_.selectable = false;
         _loc6_.autoSize = TextFieldAutoSize.CENTER;
         _loc6_.border = false;
         var _loc7_:TextStyleRepository;
         (_loc7_ = TextStyleRepository.getInstance()).register(_loc1_);
         _loc7_.register(_loc2_);
         _loc7_.register(_loc5_);
         _loc7_.register(_loc6_);
      }
   }
}
