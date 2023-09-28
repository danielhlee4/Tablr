import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { useSelector } from 'react-redux';
import ProfileButton from './ProfileButton';
import LoginFormModal from '../LoginFormModal';
import SignupFormModal from '../SignupFormModal';
import { Modal } from '../../context/Modal';
import SearchBanner from '../Search';
import './Navigation.css';
import logo from '../../assets/logo.png'

function Navigation() {
  const sessionUser = useSelector(state => state.session.user);
  const [showSearchModal, setShowSearchModal] = useState(false);

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
    <header>
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
            <button className="search-icon-button" onClick={() => setShowSearchModal(true)}> 
              <i className="fa-duotone fa-magnifying-glass"></i>
            </button>
            {showSearchModal && (
              <Modal onClose={() => setShowSearchModal(false)} className="search-modal">
                <SearchBanner />
              </Modal>
            )}
          </li>
        </ul>
      </nav>
    </header>
  );
}

export default Navigation;