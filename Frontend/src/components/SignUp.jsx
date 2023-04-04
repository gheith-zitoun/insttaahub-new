import React from 'react'

const SignUp = ({togller}) => {
  return (
<form>
    {/* <h2>Sign Up</h2> */}
    <h2>Sign Up</h2>
    <label for="email">Email:</label>
    <input type="email" placeholder="email" id="email" name="email" required />
    <label for="password">Password:</label>
    <input placeholder="Password" type="password" id="password" name="password" required />
    <button type="submit">Create</button>
    <h3 onClick={togller}>Login</h3>
  </form>  )
}

export default SignUp