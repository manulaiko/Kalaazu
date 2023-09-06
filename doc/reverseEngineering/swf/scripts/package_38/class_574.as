package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_574 implements ICommand
   {
      
      public static const ID:int = 21499;
       
      
      public var var_1152:class_456;
      
      public var var_2697:Vector.<class_856>;
      
      public var var_1675:class_540;
      
      public function class_574(param1:class_456 = null, param2:class_540 = null, param3:Vector.<class_856> = null)
      {
         super();
         if(param1 == null)
         {
            this.var_1152 = new class_456();
         }
         else
         {
            this.var_1152 = param1;
         }
         if(param2 == null)
         {
            this.var_1675 = new class_540();
         }
         else
         {
            this.var_1675 = param2;
         }
         if(param3 == null)
         {
            this.var_2697 = new Vector.<class_856>();
         }
         else
         {
            this.var_2697 = param3;
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
         this.var_1152 = class_127.getInstance().createInstance(param1.readShort()) as class_456;
         this.var_1152.read(param1);
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.var_2697.length > 0)
         {
            this.var_2697.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_856).read(param1);
            this.var_2697.push(_loc4_);
            _loc2_++;
         }
         this.var_1675 = class_127.getInstance().createInstance(param1.readShort()) as class_540;
         this.var_1675.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:* = null;
         param1.writeShort(-12358);
         this.var_1152.write(param1);
         param1.writeInt(this.var_2697.length);
         for each(_loc2_ in this.var_2697)
         {
            _loc2_.write(param1);
         }
         this.var_1675.write(param1);
      }
   }
}
