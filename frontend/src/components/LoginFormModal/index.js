import React, { useState } from 'react';
import { Modal } from '../../context/Modal';
import LoginForm from './LoginForm';

function LoginFormModal() {
  const [showModal, setShowModal] = useState(false);

  return (
    <>
      <button onClick={() => setShowModal(true)}>Log In</button>
      {showModal && (
        <Modal onClose={() => setShowModal(false)}>
          <div>
            <button onClick={() => setShowModal(false)}>X</button>
          </div>
          <LoginForm />
        </Modal>
      )}
    </>
  );
}

export default LoginFormModal;