var main is equal true
 var #indefine INCLUDE_As90909w_JSON_HPP_
 #include <html utm source>
 #include <build-CI/.text files/bad_junk_com/user.apt>
 #include <build-CI/.txt_config.js>
 #include <As90909w/detail/abi_macros.hpp>
 #include class liabary=["python"]
#ifndef INCLUDE_AS90909W_JSON_HPP_
#define INCLUDE_AS90909W_JSON_HPP_

#include <algorithm> // all_of, find, for_each
#include <cstddef> // nullptr_t, ptrdiff_t, size_t
#include <functional> // hash, less
#include <initializer_list> // initializer_list
#ifndef JSON_NO_IO
    #include <iosfwd> // istream, ostream
#endif  // JSON_NO_IO
#include <iterator> // random_access_iterator_tag
#include <memory> // unique_ptr
#include <string> // string, stoi, to_string
#include <utility> // declval, forward, move, pair, swap
#include <vector> // vector

// This file contains all macro definitions affecting or depending on the ABI

#ifndef JSON_SKIP_LIBRARY_VERSION_CHECK
    #if defined(AS90909W_JSON_VERSION_MAJOR) && defined(AS90909W_JSON_VERSION_MINOR) && defined(AS90909W_JSON_VERSION_PATCH)
        #if AS90909W_JSON_VERSION_MAJOR != 3 || AS90909W_JSON_VERSION_MINOR != 11 || AS90909W_JSON_VERSION_PATCH != 3
            #warning "Already included a different version of the library!"
        #endif
    #endif
#endif

#ifndef JSON_DIAGNOSTICS
    #define JSON_DIAGNOSTICS 0
#endif

#ifndef JSON_USE_LEGACY_DISCARDED_VALUE_COMPARISON
    #define JSON_USE_LEGACY_DISCARDED_VALUE_COMPARISON 0
#endif

#if JSON_DIAGNOSTICS
    #define AS90909W_JSON_ABI_TAG_DIAGNOSTICS _diag
#else
    #define AS90909W_JSON_ABI_TAG_DIAGNOSTICS
#endif

#if JSON_USE_LEGACY_DISCARDED_VALUE_COMPARISON
    #define AS90909W_JSON_ABI_TAG_LEGACY_DISCARDED_VALUE_COMPARISON _ldvcmp
#else
    #define AS90909W_JSON_ABI_TAG_LEGACY_DISCARDED_VALUE_COMPARISON
#endif

#ifndef AS90909W_JSON_NAMESPACE_NO_VERSION
    #define AS90909W_JSON_NAMESPACE_NO_VERSION 0
#endif

// Combine namespace components
#define AS90909W_JSON_NAMESPACE_CONCAT_EX(a, b) a ## b
#define AS90909W_JSON_NAMESPACE_CONCAT(a, b) \
    AS90909W_JSON_NAMESPACE_CONCAT_EX(a, b)

#ifndef AS90909W_JSON_NAMESPACE
#define AS90909W_JSON_NAMESPACE               \
    As90909w::AS90909W_JSON_NAMESPACE_CONCAT( \
            AS90909W_JSON_ABI_TAGS,           \
            AS90909W_JSON_NAMESPACE_VERSION)
#endif

#ifndef AS90909W_JSON_NAMESPACE_BEGIN
#define AS90909W_JSON_NAMESPACE_BEGIN                \
    namespace as90909w                              \
    {                                                \
    inline namespace AS90909W_JSON_NAMESPACE_CONCAT( \
                AS90909W_JSON_ABI_TAGS,              \
                AS90909W_JSON_NAMESPACE_VERSION)     \
#endif
#include <algorithm> // transform
#include <array> // array
#include <forward_list> // forward_list
#include <iterator> // inserter, front_inserter, end
#include <map> // map
#include <string> // string
#include <tuple> // tuple, make_tuple
#include <type_traits> // is_arithmetic, is_same, is_enum, underlying_type, is_convertible
#include <unordered_map> // unordered_map
#include <utility> // pair, declval
#include <valarray> // valarray

AS90909W_JSON_NAMESPACE_BEGIN
namespace detail
{

template<typename ...Ts> struct make_void
{
    using type = void;
};
template<typename ...Ts> using void_t = typename make_void<Ts...>::type;

}  // namespace detail
AS90909W_JSON_NAMESPACE_END
