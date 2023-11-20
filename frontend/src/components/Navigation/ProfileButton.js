import React, { useState, useEffect } from "react";
import { Link, useHistory } from 'react-router-dom';
import { useDispatch } from 'react-redux';
import * as sessionActions from '../../store/session';

function ProfileButton({ user }) {
  const dispatch = useDispatch();
  const [showMenu, setShowMenu] = useState(false);
  const history = useHistory();

  const openMenu = () => {
    if (showMenu) return;
    setShowMenu(true);
  };
  
  useEffect(() => {
    if (!showMenu) return;

    const closeMenu = () => {
      setShowMenu(false);
    };

    document.addEventListener('click', closeMenu);
  
    return () => document.removeEventListener("click", closeMenu);
  }, [showMenu]);

  const logout = (e) => {
    e.preventDefault();
    history.push("/");
    dispatch(sessionActions.logout());
  };

  return (
    <div className="profile">
      <div className="profile-button-container">
        <button id ="profile-button" onClick={openMenu}>
          <i className="fa-light fa-user"></i>
        </button>
      </div>
      {showMenu && user && (
        <div className="profile-dropdown-container">
          <ul className="profile-dropdown">
            <li id="greeting">Hello, {user?.firstName}!</li>
            <div id="divider"></div>
            <li>
              <Link to={`/users/${user?.id}/reservations`}>My Reservations</Link>
            </li>
            <li>
              <a href="https://www.linkedin.com/in/danlee-/" target="_blank">My LinkedIn</a>
            </li>
            <li>
              <a href="https://github.com/danielhlee4" target="_blank">My GitHub</a>
            </li>
            <li>
              <a href="https://wellfound.com/u/daniel-lee-300" target="_blank">My Wellfound</a>
            </li>
            <li>
              <button onClick={logout}>Log Out</button>
            </li>
          </ul>
        </div>
      )}
    </div>
  );
}

export default ProfileButton;