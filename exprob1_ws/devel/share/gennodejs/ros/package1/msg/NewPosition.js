// Auto-generated. Do not edit!

// (in-package package1.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class NewPosition {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.nx = null;
      this.ny = null;
    }
    else {
      if (initObj.hasOwnProperty('nx')) {
        this.nx = initObj.nx
      }
      else {
        this.nx = 0;
      }
      if (initObj.hasOwnProperty('ny')) {
        this.ny = initObj.ny
      }
      else {
        this.ny = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NewPosition
    // Serialize message field [nx]
    bufferOffset = _serializer.int64(obj.nx, buffer, bufferOffset);
    // Serialize message field [ny]
    bufferOffset = _serializer.int64(obj.ny, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NewPosition
    let len;
    let data = new NewPosition(null);
    // Deserialize message field [nx]
    data.nx = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [ny]
    data.ny = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'package1/NewPosition';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '865ef1ea904ca728a90504003d8b9fb0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 nx
    int64 ny
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NewPosition(null);
    if (msg.nx !== undefined) {
      resolved.nx = msg.nx;
    }
    else {
      resolved.nx = 0
    }

    if (msg.ny !== undefined) {
      resolved.ny = msg.ny;
    }
    else {
      resolved.ny = 0
    }

    return resolved;
    }
};

module.exports = NewPosition;
