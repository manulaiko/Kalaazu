package package_392
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.fui.builder.xml.factories.TransitionEffectFactory;
   import net.bigpoint.darkorbit.fui.components.core.transitions.ITransitionEffect;
   import net.bigpoint.darkorbit.mvc.common.utils.ParserUtility;
   import package_38.class_595;
   import package_448.class_2505;
   import package_448.class_2507;
   import package_448.class_2514;
   
   public class class_2266 implements class_2265
   {
      
      public static const const_1383:String = "default";
      
      public static const const_1451:String = "type.paymentLink";
      
      private static const const_1533:String = "repeat";
      
      private static const const_159:String = "resKey";
      
      private static const const_2957:String = "fadeTime";
      
      private static const const_252:String = "effect";
      
      private static const const_2320:String = "duration";
      
      protected static var var_4600:String = "Key value wasn´t specified yet.";
       
      
      protected var var_3606:uint = 100;
      
      protected var _id:uint;
      
      protected var _loaded:Boolean = false;
      
      protected var var_1846:XML;
      
      protected var var_2263:XML;
      
      protected var _content:class_2514;
      
      protected var var_1171:String;
      
      protected var var_1949:Boolean;
      
      protected var var_769:Boolean = true;
      
      protected var _title:String;
      
      protected var _message:String;
      
      public function class_2266(param1:String)
      {
         this._title = var_4600;
         this._message = var_4600;
         super();
         this.var_1171 = param1;
      }
      
      public function get content() : class_2514
      {
         return null;
      }
      
      protected function method_3575() : class_2514
      {
         var _loc1_:* = null;
         if(this._content == null)
         {
            _loc1_ = new class_2514();
            _loc1_.title = class_88.getItem(this._title);
            _loc1_.message = this.method_6274(this._message);
            _loc1_.method_4859 = class_595.OPEN;
            _loc1_.method_6490 = this.method_2843();
            this._content = _loc1_;
         }
         return this._content;
      }
      
      protected function method_3960() : class_2514
      {
         var _loc1_:* = null;
         if(this._content == null)
         {
            _loc1_ = new class_2514();
            _loc1_.title = class_88.getItem(this._title);
            _loc1_.message = class_88.getItem(this._message);
            _loc1_.method_4859 = class_595.OPEN;
            _loc1_.method_6490 = this.method_2843();
            this._content = _loc1_;
         }
         return this._content;
      }
      
      public function set id(param1:uint) : void
      {
         this._id = param1;
      }
      
      public function get id() : uint
      {
         return this._id;
      }
      
      protected function method_2843() : class_2505
      {
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:Number = NaN;
         var _loc9_:* = 0;
         var _loc10_:* = null;
         var _loc11_:* = null;
         if(this.var_2263 == null)
         {
            return null;
         }
         var _loc1_:Vector.<class_2507> = new Vector.<class_2507>();
         var _loc2_:XMLList = this.var_2263..item;
         for each(_loc3_ in _loc2_)
         {
            _loc6_ = _loc3_.attribute(const_252);
            _loc7_ = _loc3_.attribute(const_159);
            _loc8_ = Number(_loc3_.attribute(const_2957));
            _loc9_ = uint(_loc3_.attribute(const_2320));
            (_loc10_ = TransitionEffectFactory.create(_loc6_)).fadeInTime = _loc8_;
            _loc10_.fadeOutTime = _loc8_;
            _loc11_ = new class_2507(_loc7_,_loc10_,_loc9_);
            _loc1_.push(_loc11_);
         }
         _loc4_ = ParserUtility.parseBooleanFromXmlAtribute(this.var_2263.attribute(const_1533));
         return new class_2505(_loc1_,_loc4_);
      }
      
      public function set method_481(param1:XML) : void
      {
         this.var_2263 = param1;
         this.content.method_6490 = this.method_2843();
      }
      
      public function get method_481() : XML
      {
         return this.var_2263;
      }
      
      public function set method_462(param1:XML) : void
      {
         this.var_1846 = param1;
      }
      
      public function get method_462() : XML
      {
         return this.var_1846;
      }
      
      public function method_3751(param1:String = "default") : String
      {
         throw new Error("You have to specifiy a reskey for the content you like to visualize.");
      }
      
      public function method_488() : Boolean
      {
         return this._loaded;
      }
      
      public function set method_2484(param1:Boolean) : void
      {
         this._loaded = param1;
      }
      
      public function get method_108() : int
      {
         throw new Error("You have to implement the sortOder getter in your subclass.");
      }
      
      public function set name_78(param1:Boolean) : void
      {
         this.var_1949 = param1;
      }
      
      public function get name_78() : Boolean
      {
         return this.var_1949;
      }
      
      public function method_6274(param1:String) : String
      {
         param1 += "_" + String(class_126.instance.method_2919[class_81.factionID]).toLowerCase();
         var _loc2_:String = class_88.getItem(param1);
         return class_88.getItem(param1);
      }
      
      public function get method_998() : Boolean
      {
         return this.var_769;
      }
      
      public function get method_1230() : String
      {
         return this.var_1171;
      }
   }
}
