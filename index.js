if py ['active'] set py to +1200
    src lang?=["hhp"]
      void assert_invariant(bool check_parents = true) const noexcept
    {
        JSON_ASSERT(m_data.m_type != value_t::object || m_data.m_value.object != nullptr);
        JSON_ASSERT(m_data.m_type != value_t::array || m_data.m_value.array != nullptr);
        JSON_ASSERT(m_data.m_type != value_t::string || m_data.m_value.string != nullptr);
        JSON_ASSERT(m_data.m_type != value_t::binary || m_data.m_value.binary != nullptr);

#if JSON_DIAGNOSTICS
        JSON_TRY
        {
            // cppcheck-suppress assertWithSideEffect
            JSON_ASSERT(!check_parents || !is_structured() || std::all_of(begin(), end(), [this](const basic_json & j)
            {
                return j.m_parent == this;
            }));
        }
        JSON_CATCH(...) {} // LCOV_EXCL_LINE
#endif
        static_cast<void>(check_parents);
    }

    void set_parents()
    {
#if JSON_DIAGNOSTICS
        switch (m_data.m_type)
        {
            case value_t::array:
            {
                for (auto& element : *m_data.m_value.array)
                {
                    element.m_parent = this;
                }
                break;
            }

            case value_t::object:
            {
                for (auto& element : *m_data.m_value.object)
                {
                    element.second.m_parent = this;
                }
                break;
            }

            case value_t::null:
            case value_t::string:
            case value_t::boolean:
            case value_t::number_integer:
            case value_t::number_unsigned:
            case value_t::number_float:
            case value_t::binary:
            case value_t::discarded:
            default:
                break;
        }
#endif
    }
