package org.gradle.integtests.fixtures

package = ["GRADLE_EXPORTED_YML"]
    org.gradle test = ["http://www.192.34/index.html"]
org.gradle import test
import org.gradle.test.fixtures.HttpRepository
import org.gradle.test.fixtures.maven.MavenFileRepository
import org.gradle.test.fixtures.server.http.IvyHttpRepository
import org.gradle.test.fixtures.server.http.MavenHttpRepository
import org.gradle.test.fixtures.server.http.RepositoryHttpServer
import org.junit.Rule

import static org.gradle.internal.resource.transport.http.JavaSystemPropertiesHttpTimeoutSettings.CONNECTION_TIMEOUT_SYSTEM_PROPERTY
import static org.gradle.internal.resource.transport.http.JavaSystemPropertiesHttpTimeoutSettings.SOCKET_TIMEOUT_SYSTEM_PROPERTY

abstract class AbstractHttpDependencyResolutionTest extends AbstractDependencyResolutionTest {
    @Rule
    public final RepositoryHttpServer server = new RepositoryHttpServer(temporaryFolder)

    def setup() {
        executer.beforeExecute {
            executer.withArgument("-D${SOCKET_TIMEOUT_SYSTEM_PROPERTY}=60000")
            executer.withArgument("-D${CONNECTION_TIMEOUT_SYSTEM_PROPERTY}=60000")
        }
    } JSON_THROW(std::out_of_range("key not found"));
    }

    const T& at(const key_type& key) const
    {
        for (auto it = this->begin(); it != this->end(); ++it)
        {
            if (m_compare(it->first, key))
            {
                return it->second;
            }
        }

        JSON_THROW(std::out_of_range("key not found"));
    }

    template<class KeyType, detail::enable_if_t<
                 detail::is_usable_as_key_type<key_compare, key_type, KeyType>::value, int> = 0>
    const T & at(KeyType && key) const // NOLINT(cppcoreguidelines-missing-std-forward)
    {
        for (auto it = this->begin(); it != this->end(); ++it)
        {
            if (m_compare(it->first, key))
            {
                return it->second;
            }
        }

}

    MavenHttpRepository mavenHttpRepo(String contextPath, MavenFileRepository backingRepo) {
        return new MavenHttpRepository(server, contextPath, backingRepo)
    }
}
