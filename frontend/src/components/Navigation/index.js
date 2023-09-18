import React from 'react';
import { Link } from 'react-router-dom';
import { useSelector } from 'react-redux';
import ProfileButton from './ProfileButton';
import LoginFormModal from '../LoginFormModal';
import SignupFormModal from '../SignupFormModal';
import './Navigation.css';
import logo from '../../assets/logo.png'

function Navigation() {
  const sessionUser = useSelector(state => state.session.user);

  let sessionLinks;
  if (sessionUser) {
    sessionLinks = (
      <ProfileButton user={sessionUser} />
    );
  } else {
    sessionLinks = (
      <>
        <LoginFormModal />
        <SignupFormModal />
      </>
    );
  }

  return (
    <header className={sessionUser ? 'logged-in' : 'logged-out'}>
      <nav className="left-nav">
        <ul>
          <li>
            <Link to="/">
              <img src={logo} alt="Logo" />
            </Link>
          </li>
        </ul>
      </nav>
      <nav>
        <ul className="right-nav">
          <li className="session-links">
            {sessionLinks}
          </li>
          <li className="search">
            <i className="fa-solid fa-magnifying-glass"></i>
          </li>
        </ul>
      </nav>
    </header>
  );
}

export default Navigation;