// Auto-generated. Do not edit!

// (in-package package1.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Position = require('../msg/Position.js');

//-----------------------------------------------------------

let NewPosition = require('../msg/NewPosition.js');

//-----------------------------------------------------------

class NavRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.in = null;
    }
    else {
      if (initObj.hasOwnProperty('in')) {
        this.in = initObj.in
      }
      else {
        this.in = new Position();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NavRequest
    // Serialize message field [in]
    bufferOffset = Position.serialize(obj.in, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NavRequest
    let len;
    let data = new NavRequest(null);
    // Deserialize message field [in]
    data.in = Position.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'package1/NavRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '54b245c98777dbddb65707f6e8c16925';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    package1/Position in
    
    ================================================================================
    MSG: package1/Position
    int64 x
    int64 y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NavRequest(null);
    if (msg.in !== undefined) {
      resolved.in = Position.Resolve(msg.in)
    }
    else {
      resolved.in = new Position()
    }

    return resolved;
    }
};

class NavResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.out = null;
    }
    else {
      if (initObj.hasOwnProperty('out')) {
        this.out = initObj.out
      }
      else {
        this.out = new NewPosition();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NavResponse
    // Serialize message field [out]
    bufferOffset = NewPosition.serialize(obj.out, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NavResponse
    let len;
    let data = new NavResponse(null);
    // Deserialize message field [out]
    data.out = NewPosition.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'package1/NavResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '84ea29ecded721656460abd3df596359';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    package1/NewPosition out
    
    
    
    
    ================================================================================
    MSG: package1/NewPosition
    int64 nx
    int64 ny
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NavResponse(null);
    if (msg.out !== undefined) {
      resolved.out = NewPosition.Resolve(msg.out)
    }
    else {
      resolved.out = new NewPosition()
    }

    return resolved;
    }
};

module.exports = {
  Request: NavRequest,
  Response: NavResponse,
  md5sum() { return 'ecf3a247110a76fb77a2db5d9c8c5101'; },
  datatype() { return 'package1/Nav'; }
};
