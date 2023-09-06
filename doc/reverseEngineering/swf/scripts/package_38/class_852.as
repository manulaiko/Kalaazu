package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_852 implements ICommand
   {
      
      public static const ID:int = 19068;
       
      
      public var var_3315:Vector.<class_946>;
      
      public var var_4832:Vector.<class_479>;
      
      public var var_1290:Vector.<class_932>;
      
      public function class_852(param1:Vector.<class_932> = null, param2:Vector.<class_946> = null, param3:Vector.<class_479> = null)
      {
         super();
         if(param1 == null)
         {
            this.var_1290 = new Vector.<class_932>();
         }
         else
         {
            this.var_1290 = param1;
         }
         if(param2 == null)
         {
            this.var_3315 = new Vector.<class_946>();
         }
         else
         {
            this.var_3315 = param2;
         }
         if(param3 == null)
         {
            this.var_4832 = new Vector.<class_479>();
         }
         else
         {
            this.var_4832 = param3;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 12;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.var_3315.length > 0)
         {
            this.var_3315.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_946).read(param1);
            this.var_3315.push(_loc4_);
            _loc2_++;
         }
         while(this.var_4832.length > 0)
         {
            this.var_4832.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc5_ = class_127.getInstance().createInstance(param1.readShort()) as class_479).read(param1);
            this.var_4832.push(_loc5_);
            _loc2_++;
         }
         while(this.var_1290.length > 0)
         {
            this.var_1290.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc6_ = class_127.getInstance().createInstance(param1.readShort()) as class_932).read(param1);
            this.var_1290.push(_loc6_);
            _loc2_++;
         }
         param1.readShort();
         param1.readShort();
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         param1.writeInt(this.var_3315.length);
         for each(_loc2_ in this.var_3315)
         {
            _loc2_.write(param1);
         }
         param1.writeInt(this.var_4832.length);
         for each(_loc3_ in this.var_4832)
         {
            _loc3_.write(param1);
         }
         param1.writeInt(this.var_1290.length);
         for each(_loc4_ in this.var_1290)
         {
            _loc4_.write(param1);
         }
         param1.writeShort(-18323);
         param1.writeShort(-28018);
      }
   }
}
