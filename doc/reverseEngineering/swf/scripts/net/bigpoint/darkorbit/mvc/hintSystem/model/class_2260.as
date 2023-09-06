package net.bigpoint.darkorbit.mvc.hintSystem.model
{
   import flash.utils.Dictionary;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   import package_388.HintSystemNotifications;
   import package_392.class_2265;
   
   public class class_2260 extends Proxy
   {
      
      public static const NAME:String = "HintSystemProxy";
      
      public static const const_2387:uint = 4;
      
      public static const const_283:uint = 8;
       
      
      protected var var_1143:uint = 4;
      
      private var var_3027:Dictionary;
      
      public function class_2260()
      {
         super(class_2260.NAME);
         this.var_3027 = new Dictionary();
      }
      
      public function set windows(param1:Dictionary) : void
      {
         this.var_3027 = param1;
         sendNotification(HintSystemNotifications.const_382,this.method_4772());
      }
      
      public function method_4511(param1:uint, param2:class_2265) : void
      {
         var _loc3_:Boolean = false;
         if(this.var_3027)
         {
            _loc3_ = Boolean(this.method_5456(param1,param2));
            if(_loc3_)
            {
               sendNotification(HintSystemNotifications.const_382,this.method_4772());
            }
         }
      }
      
      protected function method_5456(param1:uint, param2:class_2265) : Boolean
      {
         var _loc3_:Boolean = false;
         if(this.var_3027[param1] == null)
         {
            this.var_3027[param1] = param2;
            return true;
         }
         return _loc3_;
      }
      
      public function method_2296(param1:uint) : class_2265
      {
         return this.var_3027[param1];
      }
      
      public function method_4772() : Vector.<class_2265>
      {
         var _loc2_:* = null;
         var _loc1_:Vector.<class_2265> = new Vector.<class_2265>();
         for each(_loc2_ in this.var_3027)
         {
            if(_loc2_)
            {
               _loc1_.push(_loc2_);
            }
         }
         switch(this.var_1143)
         {
            case const_2387:
               _loc1_.sort(this.method_3308);
               break;
            case const_283:
               _loc1_.sort(this.method_3028);
         }
         return _loc1_;
      }
      
      public function method_5374(param1:uint) : void
      {
         if(param1 != this.var_1143)
         {
            this.var_1143 = param1;
            sendNotification(HintSystemNotifications.const_382,this.method_4772());
         }
      }
      
      private function method_3308(param1:class_2265, param2:class_2265) : int
      {
         return Number(param2.method_108) - Number(param1.method_108);
      }
      
      private function method_3028(param1:class_2265, param2:class_2265) : int
      {
         return Number(param1.method_108) - Number(param2.method_108);
      }
   }
}
