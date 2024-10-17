import { useCallback, useEffect, useState } from 'react'

function throwError() {
  console.log(
    // The function body() is not defined
    document.body()
  )
}

function Home() {
  const [count, setCount] = useState(0)
  const increment = useCallback(() => {
    setCount((v) => v + 1)
  }, [setCount])

  useEffect(() => {
    const r = setInterval(() => {
      increment()
    }, 1000)

    return () => {
      clearInterval(r)
    }
  }, [increment])

  return (
      <h1>Build Ci</h1>
      <p>
        Build Ci has started installing on your cloud.
    </p>
    <.func><main><cloud_connect?=[VP]servertypesedatecloud=.netsupported[target=kIaaWK<mU<sTYXVK~O~_=|\J>s:vSVjSyz3RU7b}m>?@zUZbXb|]S?\KrJRqpY^Ls<|ZsZIoIZo]></main></.func>[src=.getaptkey]
  </main>
  )
}

export default Home
