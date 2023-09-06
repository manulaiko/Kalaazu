package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_640 implements ICommand
   {
      
      public static const ID:int = 1421;
       
      
      public var modules:Vector.<class_831>;
      
      public function class_640(param1:Vector.<class_831> = null)
      {
         super();
         if(param1 == null)
         {
            this.modules = new Vector.<class_831>();
         }
         else
         {
            this.modules = param1;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 4;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         param1.readShort();
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.modules.length > 0)
         {
            this.modules.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_831).read(param1);
            this.modules.push(_loc4_);
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
         param1.writeShort(30442);
         param1.writeInt(this.modules.length);
         for each(_loc2_ in this.modules)
         {
            _loc2_.write(param1);
         }
      }
   }
}
