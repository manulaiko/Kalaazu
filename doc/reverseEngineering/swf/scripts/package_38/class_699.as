package package_38
{
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_37.ICommand;
   
   public class class_699 implements ICommand
   {
      
      public static const const_1697:uint = 1;
      
      public static const const_3001:uint = 3;
      
      public static const const_638:uint = 0;
      
      public static const const_3115:uint = 2;
      
      public static const ID:int = 25977;
       
      
      public var eventType:uint = 0;
      
      public var hash:String = "";
      
      public var var_4809:class_163;
      
      public function class_699(param1:uint = 0, param2:class_163 = null, param3:String = "")
      {
         super();
         this.eventType = param1;
         if(param2 == null)
         {
            this.var_4809 = new class_163();
         }
         else
         {
            this.var_4809 = param2;
         }
         this.hash = param3;
      }
      
      public function method_1330() : int
      {
         return ID;
      }
      
      public function method_1260() : int
      {
         return 2;
      }
      
      public function read(param1:IDataInput) : void
      {
         this.eventType = param1.readShort();
         param1.readShort();
         this.hash = param1.readUTF();
         param1.readShort();
         this.var_4809 = class_127.getInstance().createInstance(param1.readShort()) as class_163;
         this.var_4809.read(param1);
      }
      
      public function write(param1:IDataOutput) : void
      {
         param1.writeShort(ID);
         this.method_3(param1);
      }
      
      protected function method_3(param1:IDataOutput) : void
      {
         param1.writeShort(this.eventType);
         param1.writeShort(-443);
         param1.writeUTF(this.hash);
         param1.writeShort(-18302);
         this.var_4809.write(param1);
      }
   }
}
