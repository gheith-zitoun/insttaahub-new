import React from 'react'
import SignIn from './SignIn'
import SignUp from './SignUp'
import { useState } from 'react'

const Authentication = () => {
  const [toggle, setToggle] = useState(true)
  const togller = () => {
    setToggle(!toggle)
  }
  return (
    <div>
      {toggle && <SignIn togller={togller} />}
      {!toggle && <SignUp togller={togller} />}
    </div>)}
export default Authentication