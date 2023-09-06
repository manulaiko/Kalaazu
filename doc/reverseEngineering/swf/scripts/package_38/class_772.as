package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_772 implements ICommand
   {
      
      public static const ID:int = 23426;
       
      
      public var var_4066:int = 0;
      
      public var ships:Vector.<class_955>;
      
      public var var_1847:Boolean = false;
      
      public var uridium:int = 0;
      
      public function class_772(param1:int = 0, param2:int = 0, param3:Boolean = false, param4:Vector.<class_955> = null)
      {
         super();
         this.var_4066 = param1;
         this.uridium = param2;
         this.var_1847 = param3;
         if(param4 == null)
         {
            this.ships = new Vector.<class_955>();
         }
         else
         {
            this.ships = param4;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 13;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         this.var_4066 = param1.readInt();
         this.var_4066 = Number(this.var_4066) >>> 4 | Number(this.var_4066) << 28;
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.ships.length > 0)
         {
            this.ships.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_955).read(param1);
            this.ships.push(_loc4_);
            _loc2_++;
         }
         this.var_1847 = param1.readBoolean();
         param1.readShort();
         this.uridium = param1.readInt();
         this.uridium = Number(this.uridium) >>> 11 | Number(this.uridium) << 21;
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         var _loc2_:* = null;
         param1.writeInt(Number(this.var_4066) << 4 | Number(this.var_4066) >>> 28);
         param1.writeInt(this.ships.length);
         for each(_loc2_ in this.ships)
         {
            _loc2_.write(param1);
         }
         param1.writeBoolean(this.var_1847);
         param1.writeShort(-5572);
         param1.writeInt(Number(this.uridium) << 11 | Number(this.uridium) >>> 21);
      }
   }
}
