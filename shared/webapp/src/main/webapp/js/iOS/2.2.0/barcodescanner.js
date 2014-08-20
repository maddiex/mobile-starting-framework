/*
  The MIT License (MIT)
  
  Copyright (C) 2014 by Kuali Foundation

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:
 
  The above copyright notice and this permission notice shall be included in

  all copies or substantial portions of the Software.
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
*/

;(function(){

//-------------------------------------------------------------------
var BarcodeScanner = function() {
}

//-------------------------------------------------------------------
BarcodeScanner.Encode = {
        TEXT_TYPE:     "TEXT_TYPE",
        EMAIL_TYPE:    "EMAIL_TYPE",
        PHONE_TYPE:    "PHONE_TYPE",
        SMS_TYPE:      "SMS_TYPE",
        CONTACT_TYPE:  "CONTACT_TYPE",
        LOCATION_TYPE: "LOCATION_TYPE"
}

//-------------------------------------------------------------------
BarcodeScanner.prototype.scan = function(success, fail, options) {
    function successWrapper(result) {
        result.cancelled = (result.cancelled == 1)
        success.call(null, result)
    }

    if (!fail) { fail = function() {}}

    if (typeof fail != "function")  {
        console.log("BarcodeScanner.scan failure: failure parameter not a function")
        return
    }

    if (typeof success != "function") {
        fail("success callback parameter must be a function")
        return
    }
  
    if ( null == options ) 
      options = []
  console.log("js.scan()");
    return Cordova.exec(successWrapper, fail, "org.apache.cordova.barcodeScanner", "scan", options)
}

//-------------------------------------------------------------------
BarcodeScanner.prototype.encode = function(type, data, success, fail, options) {
    if (!fail) { fail = function() {}}

    if (typeof fail != "function")  {
        console.log("BarcodeScanner.scan failure: failure parameter not a function")
        return
    }

    if (typeof success != "function") {
        fail("success callback parameter must be a function")
        return
    }

    return Cordova.exec(success, fail, "org.apache.cordova.barcodeScanner", "encode", [{type: type, data: data, options: options}])
}

//-------------------------------------------------------------------

// remove Cordova.addConstructor since it was not supported on PhoneGap 2.0
if (!window.plugins) window.plugins = {}

if (!window.plugins.barcodeScanner) {
    window.plugins.barcodeScanner = new BarcodeScanner()
}

})();