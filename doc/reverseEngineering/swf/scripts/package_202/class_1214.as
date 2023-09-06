package package_202
{
   import com.hurlant.crypto.prng.ARC4;
   import flash.events.EventDispatcher;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public class class_1214 extends EventDispatcher
   {
       
      
      protected var var_4156:Dictionary;
      
      protected var var_3271:ARC4;
      
      protected var var_167:ARC4;
      
      protected var activated:Boolean;
      
      protected var var_947:class_1670;
      
      public function class_1214()
      {
         this.var_4156 = new Dictionary();
         super();
         this.initialize();
      }
      
      private function initialize() : void
      {
         this.var_3271 = new ARC4();
         this.var_167 = new ARC4();
         this.var_947 = new class_1670();
      }
      
      public function setSecretKey(param1:ByteArray) : void
      {
         this.var_3271.init(param1);
         this.var_167.init(param1);
         this.activated = true;
      }
      
      public function encode(param1:ByteArray) : ByteArray
      {
         if(this.activated)
         {
            this.var_3271.encrypt(param1);
         }
         var _loc2_:ByteArray = this.var_947.encode(param1);
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeBytes(_loc2_);
         _loc3_.position = 0;
         return _loc3_;
      }
      
      public function decode(param1:ByteArray) : ByteArray
      {
         var _loc2_:ByteArray = this.var_947.decode(param1);
         if(this.activated)
         {
            this.var_167.decrypt(_loc2_);
         }
         _loc2_.position = 0;
         return _loc2_;
      }
      
      public function injectObfuscation(param1:ByteArray, param2:uint, param3:Function) : void
      {
         this.var_947.method_60(param1,param2,param3);
      }
      
      public function reset() : void
      {
         this.activated = false;
         this.var_947.deactivate();
      }
   }
}
