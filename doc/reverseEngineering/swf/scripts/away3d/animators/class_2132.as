package away3d.animators
{
   import package_199.class_2453;
   import package_304.class_2114;
   import package_386.class_2404;
   import package_386.class_2408;
   
   public class class_2132 extends class_2119
   {
       
      
      private var var_447:Vector.<class_2403>;
      
      private var var_2333:Vector.<int>;
      
      private var var_1002:int;
      
      private var eventList:Vector.<class_2404>;
      
      public function class_2132(param1:Vector.<class_2114>, param2:Vector.<class_2408>, param3:Vector.<class_2404>)
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         this.var_447 = new Vector.<class_2403>();
         super(null);
         this.var_1002 = param1.length;
         this.var_2333 = new Vector.<int>(param1.length,true);
         while(_loc4_ < this.var_1002)
         {
            _loc6_ = (_loc5_ = param1[_loc4_]).animator as class_2403;
            this.var_447.push(_loc6_);
            _loc6_.method_4101 = false;
            if(param2[_loc4_])
            {
               this.var_2333[_loc4_] = Number(param2[_loc4_].timeOffset) * 1000;
            }
            _loc4_++;
         }
         this.eventList = param3;
      }
      
      override public function start() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         super.start();
         this.time = 0;
         while(_loc1_ < this.var_1002)
         {
            _loc2_ = this.var_447[_loc1_];
            _loc2_.time = -Number(_loc2_.time) / Number(_loc2_.playbackSpeed) + _loc2_.time;
            _loc2_.method_1819(time + this.var_2333[_loc1_]);
            _loc1_++;
         }
      }
      
      override public function set time(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:int = param1 - Number(time);
         super.time = param1;
         for each(_loc3_ in this.var_447)
         {
            _loc3_.time = time;
         }
         if(this.eventList)
         {
            for each(_loc4_ in this.eventList)
            {
               if(_loc2_ != 0 && (Number(_loc4_.occurTime) * 1000 - Number(time)) * (Number(_loc4_.occurTime) * 1000 - (Number(time) - _loc2_)) <= 0)
               {
                  if(hasEventListener(class_2453.const_786))
                  {
                     dispatchEvent(new class_2453(class_2453.const_786,_loc4_));
                  }
               }
            }
         }
      }
      
      public function method_1819(param1:int = 0) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         while(_loc2_ < this.var_1002)
         {
            _loc3_ = this.var_447[_loc2_];
            _loc3_.method_1819(param1 + this.var_2333[_loc2_]);
            _loc2_++;
         }
      }
   }
}
