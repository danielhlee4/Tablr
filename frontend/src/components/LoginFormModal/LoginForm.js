import React, { useState } from "react";
import { Link } from 'react-router-dom';
import * as sessionActions from "../../store/session";
import { useDispatch, useSelector } from "react-redux";
import './LoginForm.css';

function LoginForm() {
  const dispatch = useDispatch();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [errors, setErrors] = useState([]);

  const handleSubmit = (e) => {
    e.preventDefault();
    setErrors([]);
    return dispatch(sessionActions.login({ email, password }))
      .catch(async (res) => {
        let data;
        try {
          // .clone() essentially allows you to read the response body twice
          data = await res.clone().json();
        } catch {
          data = await res.text(); // Will hit this case if, e.g., server is down
        }
        if (data?.errors) setErrors(data.errors);
        else if (data) setErrors([data]);
        else setErrors([res.statusText]);
      });
  };

  const handleDemoLogin = e => {
    dispatch(sessionActions.login({ email: 'demo@user.io', password: 'password' }))
  }

  return (
    <form id="login-form" onSubmit={handleSubmit}>
      <div id="login-credentials-container">
        <ul id="errors">
          {errors.map(error => <li key={error}>{error}</li>)}
        </ul>
        <input
          type="text"
          placeholder="Email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
        />
        <input
          type="password"
          placeholder="Password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
        />
        <button type="submit">Continue</button>
        <div id="demo-container">
          <Link id="demo-user" to="/" onClick={handleDemoLogin}>Continue as Demo User</Link>
        </div>
      </div>
    </form>
  );
}

export default LoginForm;