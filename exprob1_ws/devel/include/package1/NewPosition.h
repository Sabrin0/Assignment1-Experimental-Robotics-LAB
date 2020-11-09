// Generated by gencpp from file package1/NewPosition.msg
// DO NOT EDIT!


#ifndef PACKAGE1_MESSAGE_NEWPOSITION_H
#define PACKAGE1_MESSAGE_NEWPOSITION_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace package1
{
template <class ContainerAllocator>
struct NewPosition_
{
  typedef NewPosition_<ContainerAllocator> Type;

  NewPosition_()
    : nx(0)
    , ny(0)  {
    }
  NewPosition_(const ContainerAllocator& _alloc)
    : nx(0)
    , ny(0)  {
  (void)_alloc;
    }



   typedef int64_t _nx_type;
  _nx_type nx;

   typedef int64_t _ny_type;
  _ny_type ny;





  typedef boost::shared_ptr< ::package1::NewPosition_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::package1::NewPosition_<ContainerAllocator> const> ConstPtr;

}; // struct NewPosition_

typedef ::package1::NewPosition_<std::allocator<void> > NewPosition;

typedef boost::shared_ptr< ::package1::NewPosition > NewPositionPtr;
typedef boost::shared_ptr< ::package1::NewPosition const> NewPositionConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::package1::NewPosition_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::package1::NewPosition_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace package1

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'package1': ['/home/sabrino/exprob/exprob1_ws/src/package1/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::package1::NewPosition_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::package1::NewPosition_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::package1::NewPosition_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::package1::NewPosition_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::package1::NewPosition_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::package1::NewPosition_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::package1::NewPosition_<ContainerAllocator> >
{
  static const char* value()
  {
    return "865ef1ea904ca728a90504003d8b9fb0";
  }

  static const char* value(const ::package1::NewPosition_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x865ef1ea904ca728ULL;
  static const uint64_t static_value2 = 0xa90504003d8b9fb0ULL;
};

template<class ContainerAllocator>
struct DataType< ::package1::NewPosition_<ContainerAllocator> >
{
  static const char* value()
  {
    return "package1/NewPosition";
  }

  static const char* value(const ::package1::NewPosition_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::package1::NewPosition_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 nx\n\
int64 ny\n\
";
  }

  static const char* value(const ::package1::NewPosition_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::package1::NewPosition_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.nx);
      stream.next(m.ny);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct NewPosition_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::package1::NewPosition_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::package1::NewPosition_<ContainerAllocator>& v)
  {
    s << indent << "nx: ";
    Printer<int64_t>::stream(s, indent + "  ", v.nx);
    s << indent << "ny: ";
    Printer<int64_t>::stream(s, indent + "  ", v.ny);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PACKAGE1_MESSAGE_NEWPOSITION_H