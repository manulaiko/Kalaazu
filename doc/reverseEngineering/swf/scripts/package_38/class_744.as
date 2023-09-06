package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_744 implements ICommand
   {
      
      public static const ID:int = 19907;
       
      
      public var var_21:Vector.<int>;
      
      public var var_2632:int = 0;
      
      public var var_4266:int = 0;
      
      public function class_744(param1:int = 0, param2:int = 0, param3:Vector.<int> = null)
      {
         super();
         this.var_2632 = param1;
         this.var_4266 = param2;
         if(param3 == null)
         {
            this.var_21 = new Vector.<int>();
         }
         else
         {
            this.var_21 = param3;
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
         var _loc4_:* = 0;
         param1.readShort();
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.var_21.length > 0)
         {
            this.var_21.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            _loc4_ = (_loc4_ = int(param1.readInt())) << 5 | _loc4_ >>> 27;
            this.var_21.push(_loc4_);
            _loc2_++;
         }
         this.var_2632 = param1.readInt();
         this.var_2632 = Number(this.var_2632) << 1 | Number(this.var_2632) >>> 31;
         this.var_4266 = param1.readInt();
         this.var_4266 = Number(this.var_4266) << 12 | Number(this.var_4266) >>> 20;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:int = 0;
         param1.writeShort(10776);
         param1.writeInt(this.var_21.length);
         for each(_loc2_ in this.var_21)
         {
            param1.writeInt(_loc2_ >>> 5 | _loc2_ << 27);
         }
         param1.writeInt(Number(this.var_2632) >>> 1 | Number(this.var_2632) << 31);
         param1.writeInt(Number(this.var_4266) >>> 12 | Number(this.var_4266) << 20);
      }
   }
}
