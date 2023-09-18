import React, { useState, useEffect } from "react";
import { NavLink } from 'react-router-dom';
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
    <>
      <div className="profile-button">
        <button onClick={openMenu}>
          <i className="fa-solid fa-utensils"></i>
        </button>
      </div>
      {showMenu && (
        <ul className="profile-dropdown">
          <li>Hello, {user.firstName}!</li>
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
      )}
    </>
  );
}

export default ProfileButton;