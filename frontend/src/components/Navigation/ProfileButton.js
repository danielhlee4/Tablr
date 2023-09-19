import React, { useState, useEffect } from "react";
import { useDispatch } from 'react-redux';
import * as sessionActions from '../../store/session';

function ProfileButton({ user }) {
  const dispatch = useDispatch();
  const [showMenu, setShowMenu] = useState(false);
  
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
    dispatch(sessionActions.logout());
  };

  return (
    <div className="profile">
      <div className="profile-button-container">
        <button id ="profile-button" onClick={openMenu}>
          <i className="fa-solid fa-utensils"></i>
        </button>
      </div>
      {showMenu && (
        <div className="profile-dropdown-container">
          <ul className="profile-dropdown">
            <li id="greeting">Hello, {user.firstName}!</li>
            <div id="divider"></div>
            <li>
              <a href="https://www.linkedin.com">My LinkedIn</a>
            </li>
            <li>
              <a href="https://www.github.com">My GitHub</a>
            </li>
            <li>
              <a href="https://www.wellfound.com">My Wellfound</a>
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