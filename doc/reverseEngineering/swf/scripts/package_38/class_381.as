package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_381 implements ICommand
   {
      
      public static const const_1247:uint = 11;
      
      public static const FROSTED_GATES:uint = 0;
      
      public static const const_3143:uint = 4;
      
      public static const const_3035:uint = 5;
      
      public static const const_122:uint = 2;
      
      public static const const_1843:uint = 7;
      
      public static const DEMOLISHED_HQ:uint = 8;
      
      public static const const_2396:uint = 10;
      
      public static const CHRISTMAS_TREES:uint = 1;
      
      public static const const_2582:uint = 9;
      
      public static const const_2583:uint = 6;
      
      public static const const_509:uint = 3;
      
      public static const ID:int = 23438;
       
      
      public var type:uint = 0;
      
      public var active:Boolean = false;
      
      public var attributes:Vector.<class_606>;
      
      public function class_381(param1:uint = 0, param2:Vector.<class_606> = null, param3:Boolean = false)
      {
         super();
         this.type = param1;
         if(param2 == null)
         {
            this.attributes = new Vector.<class_606>();
         }
         else
         {
            this.attributes = param2;
         }
         this.active = param3;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 5;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         this.type = param1.readShort();
         this.active = param1.readBoolean();
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.attributes.length > 0)
         {
            this.attributes.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_606).read(param1);
            this.attributes.push(_loc4_);
            _loc2_++;
         }
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:* = null;
         param1.writeShort(this.type);
         param1.writeBoolean(this.active);
         param1.writeInt(this.attributes.length);
         for each(_loc2_ in this.attributes)
         {
            _loc2_.write(param1);
         }
      }
   }
}
