package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_736 implements ICommand
   {
      
      public static const NOT_ASSIGNED:uint = 0;
      
      public static const GAME_FEATURE_BAR:uint = 1;
      
      public static const GENERIC_FEATURE_BAR:uint = 2;
      
      public static const ID:int = 21788;
       
      
      public var var_1484:uint = 0;
      
      public var var_1153:String = "";
      
      public var var_2939:String = "";
      
      public var var_5035:Vector.<class_864>;
      
      public function class_736(param1:uint = 0, param2:Vector.<class_864> = null, param3:String = "", param4:String = "")
      {
         super();
         this.var_1484 = param1;
         if(param2 == null)
         {
            this.var_5035 = new Vector.<class_864>();
         }
         else
         {
            this.var_5035 = param2;
         }
         this.var_2939 = param3;
         this.var_1153 = param4;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 8;
      }
      
      public function read(param1:IDataInput) : void
      {
         var _loc4_:* = null;
         this.var_1484 = param1.readShort();
         this.var_1153 = param1.readUTF();
         this.var_2939 = param1.readUTF();
         var _loc2_:Number = 0;
         var _loc3_:* = 0;
         while(this.var_5035.length > 0)
         {
            this.var_5035.pop();
         }
         _loc2_ = 0;
         _loc3_ = uint(param1.readInt());
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_864).read(param1);
            this.var_5035.push(_loc4_);
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
         param1.writeShort(this.var_1484);
         param1.writeUTF(this.var_1153);
         param1.writeUTF(this.var_2939);
         param1.writeInt(this.var_5035.length);
         for each(_loc2_ in this.var_5035)
         {
            _loc2_.write(param1);
         }
      }
   }
}
