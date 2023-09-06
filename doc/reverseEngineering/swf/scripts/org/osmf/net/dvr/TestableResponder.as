package org.osmf.net.dvr
{
   import flash.net.Responder;
   
   class TestableResponder extends Responder
   {
       
      
      private var _result:Function;
      
      private var _status:Function;
      
      function TestableResponder(param1:Function, param2:Function = null)
      {
         this._result = param1;
         this._status = param2;
         super(param1,param2);
      }
      
      function get result() : Function
      {
         return this._result;
      }
      
      function get status() : Function
      {
         return this._status;
      }
   }
}
