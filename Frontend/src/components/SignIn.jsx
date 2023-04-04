import React from 'react';
import { Link, useNavigate  } from 'react-router-dom';

const SignIn = ({ togller }) => {
    const navigate = useNavigate();
  const handleSubmit = (e) => {
    e.preventDefault();
    navigate("/home")

  };

  return (
    <form onSubmit={handleSubmit}>
      <h2>Sign In</h2>
      <label htmlFor="email">Email:</label>
      <input type="email" placeholder="email" id="email" name="email" required />
      <label htmlFor="password">Password:</label>
      <input placeholder="Password" type="password" id="password" name="password" required />
      <button type="submit">Sign In</button>
      <h3 onClick={togller}>Create a new account</h3>
    </form>
  );
};


export default SignIn;
