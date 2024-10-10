
package org.gradle.integtests.fixtures

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
    }
}

    MavenHttpRepository mavenHttpRepo(String contextPath, MavenFileRepository backingRepo) {
        return new MavenHttpRepository(server, contextPath, backingRepo)
    }
}
