package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_238 implements ICommand
   {
      
      public static const ID:int = 10794;
       
      
      public var id:int = 0;
      
      public var name_19:String = "";
      
      public var var_2657:class_870;
      
      public var icons:Vector.<class_780>;
      
      public var var_3107:String = "";
      
      public var rewards:Vector.<class_771>;
      
      public var name_160:Vector.<class_861>;
      
      public function class_238(param1:int = 0, param2:Vector.<class_861> = null, param3:class_870 = null, param4:Vector.<class_771> = null, param5:Vector.<class_780> = null, param6:String = "", param7:String = "")
      {
         super();
         this.id = param1;
         if(param2 == null)
         {
            this.name_160 = new Vector.<class_861>();
         }
         else
         {
            this.name_160 = param2;
         }
         if(param3 == null)
         {
            this.var_2657 = new class_870();
         }
         else
         {
            this.var_2657 = param3;
         }
         if(param4 == null)
         {
            this.rewards = new Vector.<class_771>();
         }
         else
         {
            this.rewards = param4;
         }
         if(param5 == null)
         {
            this.icons = new Vector.<class_780>();
         }
         else
         {
            this.icons = param5;
         }
         this.var_3107 = param6;
         this.name_19 = param7;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 20;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         this.id = param1.readInt();
         this.id = Number(this.id) << 15 | Number(this.id) >>> 17;
         this.name_19 = param1.readUTF();
         this.var_2657 = class_127.getInstance().createInstance(param1.readShort()) as class_870;
         this.var_2657.read(param1);
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.icons.length > 0)
         {
            this.icons.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_780).read(param1);
            this.icons.push(_loc4_);
            _loc2_++;
         }
         this.var_3107 = param1.readUTF();
         while(this.rewards.length > 0)
         {
            this.rewards.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc5_ = class_127.getInstance().createInstance(param1.readShort()) as class_771).read(param1);
            this.rewards.push(_loc5_);
            _loc2_++;
         }
         while(this.name_160.length > 0)
         {
            this.name_160.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc6_ = class_127.getInstance().createInstance(param1.readShort()) as class_861).read(param1);
            this.name_160.push(_loc6_);
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
         var _loc3_:* = null;
         var _loc4_:* = null;
         param1.writeInt(Number(this.id) >>> 15 | Number(this.id) << 17);
         param1.writeUTF(this.name_19);
         this.var_2657.write(param1);
         param1.writeInt(this.icons.length);
         for each(_loc2_ in this.icons)
         {
            _loc2_.write(param1);
         }
         param1.writeUTF(this.var_3107);
         param1.writeInt(this.rewards.length);
         for each(_loc3_ in this.rewards)
         {
            _loc3_.write(param1);
         }
         param1.writeInt(this.name_160.length);
         for each(_loc4_ in this.name_160)
         {
            _loc4_.write(param1);
         }
      }
   }
}
