package mx.binding
{
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   
   public class BindabilityInfo
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      public static const BINDABLE:String = "Bindable";
      
      public static const MANAGED:String = "Managed";
      
      public static const CHANGE_EVENT:String = "ChangeEvent";
      
      public static const NON_COMMITTING_CHANGE_EVENT:String = "NonCommittingChangeEvent";
      
      public static const ACCESSOR:String = "accessor";
      
      public static const METHOD:String = "method";
       
      
      private var typeDescription:XML;
      
      private var classChangeEvents:Object;
      
      private var childChangeEvents:Object;
      
      public function BindabilityInfo(param1:XML)
      {
         this.childChangeEvents = {};
         super();
         this.typeDescription = param1;
      }
      
      public function getChangeEvents(param1:String) : Object
      {
         var childDesc:XMLList = null;
         var numChildren:int = 0;
         var childName:String = param1;
         var changeEvents:Object = this.childChangeEvents[childName];
         if(!changeEvents)
         {
            changeEvents = this.copyProps(this.getClassChangeEvents(),{});
            childDesc = this.typeDescription.accessor.(@name == childName) + this.typeDescription.method.(@name == childName);
            numChildren = childDesc.length();
            if(numChildren == 0)
            {
               if(!this.typeDescription.@var_2336)
               {
                  trace("warning: no describeType entry for \'" + childName + "\' on non-dynamic type \'" + this.typeDescription.@name + "\'");
               }
            }
            else
            {
               if(numChildren > 1)
               {
                  trace("warning: multiple describeType entries for \'" + childName + "\' on type \'" + this.typeDescription.@name + "\':\n" + childDesc);
               }
               this.addBindabilityEvents(childDesc.metadata,changeEvents);
            }
            this.childChangeEvents[childName] = changeEvents;
         }
         return changeEvents;
      }
      
      private function getClassChangeEvents() : Object
      {
         if(!this.classChangeEvents)
         {
            this.classChangeEvents = {};
            this.addBindabilityEvents(this.typeDescription.metadata,this.classChangeEvents);
            if(this.typeDescription.metadata.(@name == MANAGED).length() > 0)
            {
               this.classChangeEvents[PropertyChangeEvent.PROPERTY_CHANGE] = true;
            }
         }
         return this.classChangeEvents;
      }
      
      private function addBindabilityEvents(param1:XMLList, param2:Object) : void
      {
         var metadata:XMLList = param1;
         var eventListObj:Object = param2;
         this.addChangeEvents(metadata.(@name == BINDABLE),eventListObj,true);
         this.addChangeEvents(metadata.(@name == CHANGE_EVENT),eventListObj,true);
         this.addChangeEvents(metadata.(@name == NON_COMMITTING_CHANGE_EVENT),eventListObj,false);
      }
      
      private function addChangeEvents(param1:XMLList, param2:Object, param3:Boolean) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         for each(_loc4_ in param1)
         {
            if((_loc5_ = _loc4_.arg).length() > 0)
            {
               _loc6_ = _loc5_[0].@value;
               param2[_loc6_] = param3;
            }
            else
            {
               trace("warning: unconverted Bindable metadata in class \'" + this.typeDescription.@name + "\'");
            }
         }
      }
      
      private function copyProps(param1:Object, param2:Object) : Object
      {
         var _loc3_:* = null;
         for(_loc3_ in param1)
         {
            param2[_loc3_] = param1[_loc3_];
         }
         return param2;
      }
   }
}
