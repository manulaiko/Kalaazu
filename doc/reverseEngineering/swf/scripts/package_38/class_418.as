package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_418 implements ICommand
   {
      
      public static const REMOVE:uint = 1;
      
      public static const ADD:uint = 0;
      
      public static const ID:int = 10939;
       
      
      public var var_2012:uint = 0;
      
      public var var_3396:Vector.<int>;
      
      public var var_1815:int = 0;
      
      public function class_418(param1:uint = 0, param2:int = 0, param3:Vector.<int> = null)
      {
         super();
         this.var_2012 = param1;
         this.var_1815 = param2;
         if(param3 == null)
         {
            this.var_3396 = new Vector.<int>();
         }
         else
         {
            this.var_3396 = param3;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 6;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = 0;
         this.var_2012 = param1.readShort();
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.var_3396.length > 0)
         {
            this.var_3396.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            _loc4_ = (_loc4_ = int(param1.readInt())) << 6 | _loc4_ >>> 26;
            this.var_3396.push(_loc4_);
            _loc2_++;
         }
         param1.readShort();
         this.var_1815 = param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:int = 0;
         param1.writeShort(this.var_2012);
         param1.writeInt(this.var_3396.length);
         for each(_loc2_ in this.var_3396)
         {
            param1.writeInt(_loc2_ >>> 6 | _loc2_ << 26);
         }
         param1.writeShort(29952);
         param1.writeShort(this.var_1815);
      }
   }
}
