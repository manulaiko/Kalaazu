package org.osmf.net.dvr
{
   import flash.errors.IllegalOperationError;
   import org.osmf.utils.OSMFStrings;
   
   public class DVRCastStreamInfo
   {
       
      
      public var callTime:Date;
      
      public var offline:Boolean;
      
      public var beginOffset:Number;
      
      public var endOffset:Number;
      
      public var recordingStart:Date;
      
      public var recordingEnd:Date;
      
      public var isRecording:Boolean;
      
      public var streamName:String;
      
      public var lastUpdate:Date;
      
      public var currentLength:Number;
      
      public var maxLength:Number;
      
      public function DVRCastStreamInfo(param1:Object)
      {
         super();
         this.readFromDynamicObject(param1);
      }
      
      public function readFromDynamicObject(param1:Object) : void
      {
         var value:Object = param1;
         try
         {
            this.callTime = value.callTime;
            this.offline = value.offline;
            this.beginOffset = value.begOffset;
            this.endOffset = value.endOffset;
            this.recordingStart = value.startRec;
            this.recordingEnd = value.stopRec;
            this.isRecording = value.isRec;
            this.streamName = value.streamName;
            this.lastUpdate = value.lastUpdate;
            this.currentLength = value.currLen;
            this.maxLength = value.maxLen;
         }
         catch(e:Error)
         {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
         }
      }
      
      public function readFromDVRCastStreamInfo(param1:DVRCastStreamInfo) : void
      {
         var value:DVRCastStreamInfo = param1;
         try
         {
            this.callTime = value.callTime;
            this.offline = value.offline;
            this.beginOffset = value.beginOffset;
            this.endOffset = value.endOffset;
            this.recordingStart = value.recordingStart;
            this.recordingEnd = value.recordingEnd;
            this.isRecording = value.isRecording;
            this.streamName = value.streamName;
            this.lastUpdate = value.lastUpdate;
            this.currentLength = value.currentLength;
            this.maxLength = value.maxLength;
         }
         catch(e:Error)
         {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
         }
      }
      
      public function toString() : String
      {
         return "callTime: " + this.callTime + "\noffline: " + this.offline + "\nbeginOffset: " + this.beginOffset + "\nendOffset: " + this.endOffset + "\nrecordingStart: " + this.recordingStart + "\nrecordingEnd: " + this.recordingEnd + "\nisRecording: " + this.isRecording + "\nstreamName: " + this.streamName + "\nlastUpdate: " + this.lastUpdate + "\ncurrentLength: " + this.currentLength + "\nmaxLength: " + this.maxLength;
      }
   }
}
