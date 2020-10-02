// Generated by gencpp from file zxcar_3d_slam/GetObjectLocationRequest.msg
// DO NOT EDIT!


#ifndef ZXCAR_3D_SLAM_MESSAGE_GETOBJECTLOCATIONREQUEST_H
#define ZXCAR_3D_SLAM_MESSAGE_GETOBJECTLOCATIONREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace zxcar_3d_slam
{
template <class ContainerAllocator>
struct GetObjectLocationRequest_
{
  typedef GetObjectLocationRequest_<ContainerAllocator> Type;

  GetObjectLocationRequest_()
    : object_name()  {
    }
  GetObjectLocationRequest_(const ContainerAllocator& _alloc)
    : object_name(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _object_name_type;
  _object_name_type object_name;





  typedef boost::shared_ptr< ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator> const> ConstPtr;

}; // struct GetObjectLocationRequest_

typedef ::zxcar_3d_slam::GetObjectLocationRequest_<std::allocator<void> > GetObjectLocationRequest;

typedef boost::shared_ptr< ::zxcar_3d_slam::GetObjectLocationRequest > GetObjectLocationRequestPtr;
typedef boost::shared_ptr< ::zxcar_3d_slam::GetObjectLocationRequest const> GetObjectLocationRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator1> & lhs, const ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator2> & rhs)
{
  return lhs.object_name == rhs.object_name;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator1> & lhs, const ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace zxcar_3d_slam

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2f12226348d323c2e5b2031b3da53f1b";
  }

  static const char* value(const ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2f12226348d323c2ULL;
  static const uint64_t static_value2 = 0xe5b2031b3da53f1bULL;
};

template<class ContainerAllocator>
struct DataType< ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "zxcar_3d_slam/GetObjectLocationRequest";
  }

  static const char* value(const ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string object_name\n"
;
  }

  static const char* value(const ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.object_name);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetObjectLocationRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::zxcar_3d_slam::GetObjectLocationRequest_<ContainerAllocator>& v)
  {
    s << indent << "object_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.object_name);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ZXCAR_3D_SLAM_MESSAGE_GETOBJECTLOCATIONREQUEST_H