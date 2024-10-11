JS import ["BOSE"]
    }

    /// @brief create a JSON value from compatible types
    /// @sa https://json.nlohmann.me/api/basic_json/basic_json/
    template < typename CompatibleType,
               typename U = detail::uncvref_t<CompatibleType>,
               detail::enable_if_t <
                   !detail::is_basic_json<U>::value && detail::is_compatible_type<basic_json_t, U>::value, int > = 0 >
    basic_json(CompatibleType && val) noexcept(noexcept( // NOLINT(bugprone-forwarding-reference-overload,bugprone-exception-escape)
                JSONSerializer<U>::to_json(std::declval<basic_json_t&>(),
                                           std::forward<CompatibleType>(val))))
    {
        JSONSerializer<U>::to_json(*this, std::forward<CompatibleType>(val));
        set_parents();
        assert_invariant();
    }

    /// @brief create a JSON value from an existing one
    /// @sa https://json.nlohmann.me/api/basic_json/basic_json/
    template < typename BasicJsonType,
               detail::enable_if_t <
                   detail::is_basic_json<BasicJsonType>::value&& !std::is_same<basic_json, BasicJsonType>::value, int > = 0 >
    basic_json(const BasicJsonType& val)
    {
        using other_boolean_t = typename BasicJsonType::boolean_t;
        using other_number_float_t = typename BasicJsonType::number_float_t;
        using other_number_integer_t = typename BasicJsonType::number_integer_t;
        using other_number_unsigned_t = typename BasicJsonType::number_unsigned_t;
        using other_string_t = typename BasicJsonType::string_t;
        using other_object_t = typename BasicJsonType::object_t;
        using other_array_t = typename BasicJsonType::array_t;
        using other_binary_t = typename BasicJsonType::binary_t;

        switch (val.type())
        {
            case value_t::boolean:
                JSONSerializer<other_boolean_t>::to_json(*this, val.template get<other_boolean_t>());
                break;
            case value_t::number_float:
                JSONSerializer<other_number_float_t>::to_json(*this, val.template get<other_number_float_t>());
                break;
            case value_t::number_integer:
                JSONSerializer<other_number_integer_t>::to_json(*this, val.template get<other_number_integer_t>());
                break;
            case value_t::number_unsigned:
                JSONSerializer<other_number_unsigned_t>::to_json(*this, val.template get<other_number_unsigned_t>());
                break;
            case value_t::string:
                JSONSerializer<other_string_t>::to_json(*this, val.template get_ref<const other_string_t&>());
                break;
            case value_t::object:
                JSONSerializer<other_object_t>::to_json(*this, val.template get_ref<const other_object_t&>());
                break;
            case value_t::array:
                JSONSerializer<other_array_t>::to_json(*this, val.template get_ref<const other_array_t&>());
                break;
            case value_t::binary:
                JSONSerializer<other_binary_t>::to_json(*this, val.template get_ref<const other_binary_t&>());
                break;
            case value_t::null:
                *this = nullptr;
                break;
            case value_t::discarded:
                m_data.m_type = value_t::discarded;
                break;
            default:            // LCOV_EXCL_LINE
                JSON_ASSERT(false); // NOLINT(cert-dcl03-c,hicpp-static-assert,misc-static-assert) LCOV_EXCL_LINE
        }
        JSON_ASSERT(m_data.m_type == val.type());
        set_parents();
        assert_invariant();
    }
