package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_645 implements ICommand
   {
      
      public static const ID:int = 30106;
       
      
      public var slotBars:Vector.<class_578>;
      
      public var categories:Vector.<class_635>;
      
      public var var_4159:String = "";
      
      public function class_645(param1:Vector.<class_635> = null, param2:String = "", param3:Vector.<class_578> = null)
      {
         super();
         if(param1 == null)
         {
            this.categories = new Vector.<class_635>();
         }
         else
         {
            this.categories = param1;
         }
         this.var_4159 = param2;
         if(param3 == null)
         {
            this.slotBars = new Vector.<class_578>();
         }
         else
         {
            this.slotBars = param3;
         }
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 10;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.slotBars.length > 0)
         {
            this.slotBars.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_578).read(param1);
            this.slotBars.push(_loc4_);
            _loc2_++;
         }
         param1.readShort();
         while(this.categories.length > 0)
         {
            this.categories.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc5_ = class_127.getInstance().createInstance(param1.readShort()) as class_635).read(param1);
            this.categories.push(_loc5_);
            _loc2_++;
         }
         param1.readShort();
         this.var_4159 = param1.readUTF();
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
         param1.writeInt(this.slotBars.length);
         for each(_loc2_ in this.slotBars)
         {
            _loc2_.write(param1);
         }
         param1.writeShort(-16701);
         param1.writeInt(this.categories.length);
         for each(_loc3_ in this.categories)
         {
            _loc3_.write(param1);
         }
         param1.writeShort(3664);
         param1.writeUTF(this.var_4159);
      }
   }
}
