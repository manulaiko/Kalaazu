package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_870 implements ICommand
   {
      
      public static const ID:int = 15763;
       
      
      public var var_2708:Vector.<class_778>;
      
      public var active:Boolean = false;
      
      public var id:int = 0;
      
      public var ordered:Boolean = false;
      
      public var name_62:Boolean = false;
      
      public var var_1979:int = 0;
      
      public function class_870(param1:int = 0, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false, param5:int = 0, param6:Vector.<class_778> = null)
      {
         super();
         this.id = param1;
         this.active = param2;
         this.name_62 = param3;
         this.ordered = param4;
         this.var_1979 = param5;
         if(param6 == null)
         {
            this.var_2708 = new Vector.<class_778>();
         }
         else
         {
            this.var_2708 = param6;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 15;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.var_2708.length > 0)
         {
            this.var_2708.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_778).read(param1);
            this.var_2708.push(_loc4_);
            _loc2_++;
         }
         this.active = param1.readBoolean();
         this.id = param1.readInt();
         this.id = Number(this.id) >>> 7 | Number(this.id) << 25;
         this.ordered = param1.readBoolean();
         this.name_62 = param1.readBoolean();
         this.var_1979 = param1.readInt();
         this.var_1979 = Number(this.var_1979) >>> 6 | Number(this.var_1979) << 26;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:* = null;
         param1.writeInt(this.var_2708.length);
         for each(_loc2_ in this.var_2708)
         {
            _loc2_.write(param1);
         }
         param1.writeBoolean(this.active);
         param1.writeInt(Number(this.id) << 7 | Number(this.id) >>> 25);
         param1.writeBoolean(this.ordered);
         param1.writeBoolean(this.name_62);
         param1.writeInt(Number(this.var_1979) << 6 | Number(this.var_1979) >>> 26);
      }
   }
}
