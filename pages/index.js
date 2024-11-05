import { useCallback, useEffect, useState } from 'react'
import Button from '../components/Button'
import Pages from '../index.html'
import styles from '../styles.css'

function throwError() {
  console.log(
    // The function body() is not defined
    document.body()
  )
}
export default Home
